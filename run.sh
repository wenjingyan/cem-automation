#!/bin/bash
######################################################################################################################
#          FILE:  run.sh                                                                                             #
#         USAGE:  ./run.sh                                                                                           #
#   DESCRIPTION:  This script is a wrapper for CEMExportTool.jar which is used to extract data from CA CEM database  #
#        AUTHOR:  Wenjing Yan                                                                                        #
#       COMPANY:  Accenture Australia Ltd.                                                                           #
#       CREATED:  25/05/2016 05:23:00 PM AEST                                                                        #
# LAST MODIFIED:  08/06/2016 09:46:00 AM AEST                                                                        #
#      REVISION:  v0.6 - integrated with Splunk                                                                      #
######################################################################################################################

# log
function log {
    echo "[$(date)] $1" 2>&1 >> "$LOG_HOME/run.log"
}

# create a lock file to ensure only one instance can be run at a time
[ -f /tmp/lock.file ] && exit
echo $$ > /tmp/lock.file
sleep 1
[ "x$(cat /tmp/lock.file)" == 'x'$$ ] || exit

# set env variables
HOME='/oracle/apm/app/splunk/etc/apps/apm_data_analysis_data/bin'
OUTPUT="$HOME/outputs"
LOG_HOME="$HOME/logs"
OS=$(uname)
if [ "$OS" == 'Linux' ]; then
    JAVA_HOME="$HOME/jdk/jdk1.8.0_91"
elif [ "$OS" == 'Darwin' ]; then
    JAVA_HOME='/usr'
fi

# load configurations
. "$HOME/configs/master.conf"
log '[INIT] Initialisation completed.'

# build parameters
if [ "$OS" == 'Linux' ]; then
    if [ $RETROSPECT_DAY -eq 0 ]; then
        start_date=$(date +"%m/%d/%y" -d "4 hour ago")
        end_date=$(date +"%m/%d/%y")
        START_TIME="$(date --date='5hours ago' +'%H'):00" 
        END_TIME="$(date --date='1hours ago' +'%H'):00"
    else
        start_date=$(date --date="${RETROSPECT_DAY} days ago" +"%m/%d/%y")
	previous=$((${RETROSPECT_DAY} - 1))
        end_date=$(date --date="${previous} days ago" +"%m/%d/%y")
    fi

    #add start/end time offsets to align with manual export time window
    START_TIME_OFFSET="$(date +'%H:%M' -d "$START_TIME 1 hour")"
    END_TIME_OFFSET="$(date +'%H:%M' -d "$END_TIME 1 hour")"
elif [ "$OS" == 'Darwin' ]; then
    if [ $RETROSPECT_DAY -eq 0 ]; then
        start_date=$(date +"%m/%d/%y")
        end_date=$(date +"%m/%d/%y")
        START_TIME="$(date -v -2h +'%H'):00"
        END_TIME="$(date -v -1h +'%H'):00"
    else
        start_date=$(date -v -${RETROSPECT_DAY}d +"%m/%d/%y")
	previous=$((${RETROSPECT_DAY} - 1))
        end_date=$(date -v -${previous}d +"%m/%d/%y")
    fi
fi 
start_timestamp="$start_date $START_TIME_OFFSET"
end_timestamp="$end_date $END_TIME_OFFSET"
if [ "$OS" == 'Linux' ]; then
    start_timestamp_output=$(date -d"$start_timestamp" +"%Y%m%d%H%M")
    end_timestamp_output=$(date -d"$end_timestamp" +"%Y%m%d%H%M")
elif [ "$OS" == 'Darwin' ]; then
    start_timestamp_output=$(date -jf "%m/%d/%y %H:%M" "$start_timestamp" +"%Y%m%d%H%M")
    end_timestamp_output=$(date -jf "%m/%d/%y %H:%M" "$end_timestamp" +"%Y%m%d%H%M")
fi

# load commands from registry
commands=()
descriptions=()
while read -r line; do
    [[ "$line" == \#* ]] && continue
    command=$(echo "$line" | sed 's/^\(.*\):.*/\1/g') 
    description=$(echo "$line" | sed 's/.*:\ *\(.*\)$/\1/g')
    commands+=("$command") 
    descriptions+=("$description")
done < "$HOME/configs/commands.conf"

# pulling data from cem server
start_timestamp="$start_date $START_TIME_OFFSET"
end_timestamp="$end_date $END_TIME_OFFSET"
for((i=0; i<${#commands[@]}; i++)); do
    command="${commands[$i]}"
    description=$(echo "${descriptions[$i]}" | tr '[A-Z]' '[a-z]') 
    if [[ "$description" = *statistics* ]]; then
        output_file="statistics_${start_timestamp_output}_${end_timestamp_output}.csv"
        arguments="-command \"$command\" -interval \"$INTERVAL\" -start \"$start_timestamp\" -end \"$end_timestamp\" -appname \"$APPNAME\" -bpname \"$BPNAME\" -btname \"$BTNAME\" -usergroup \"$USERGROUP\" -pthroughput \"$PTHROUGHPUT\" -psize \"$PSIZE\" -ptime \"$PTIME\""
    elif [[ "$description" = *incidents* ]]; then
        output_file="incidents_${start_timestamp_output}_${end_timestamp_output}.csv"
        arguments="-command \"$command\" -start \"$start_timestamp\" -end \"$end_timestamp\""
    elif [[ "$description" = *defects* ]]; then
        output_file="defects_${start_timestamp_output}_${end_timestamp_output}.csv"
        arguments="-command \"$command\" -start \"$start_timestamp\" -end \"$end_timestamp\" -appname \"$APPNAME\" -bpname \"$BPNAME\" -btname \"$BTNAME\" -usergroup \"$USERGROUP\" -dtype \"$DTYPE\""
    fi 

    # extract cem data
    # example: java -jar CEMExportTool.jar -host cembox -username username -password password -port 8081 -command 2 -output data.csv -interval 3 -start "1/01/2010 00:00:00" -end "3/15/2010 23:59:00"
    log "[START] ${descriptions[$i]} ($start_timestamp to $end_timestamp)"
    eval "$JAVA_HOME/bin/java -jar ${HOME}/cem/CEMExportTool.jar -host \"$CEM_HOST\" -port \"$CEM_PORT\" -username \"$USERNAME\" -password \"$PASSWORD\" -output \"$OUTPUT/$output_file\" $arguments 2>&1 >> $LOG_HOME/threaddump.log" 
    echo '======================================================================================================' >> "$LOG_HOME/threaddump.log"
    log "[END] ${descriptions[$i]} ($start_timestamp to $end_timestamp)"
done

# print to stdout for Splunk integration
cat "$OUTPUT/$output_file"
log '[SPLUNK] Print out data to STDOUT for Splunk.' 

# rotate logs if required
last_index=$(find $LOG_HOME -name '*log.*' -exec basename {} \; | sort -r | head -1 | awk -F '.' '{print$NF}');
[ -z "$last_index" ] && last_index=0
[ $last_index -ge $INDEX_LIMIT ] && rm ${LOG_HOME}/*log.* || find $LOG_HOME -name *.log -size +${SIZE_LIMIT} -exec mv {} {}.$((last_index + 1)) \;

# release lock
rm -f /tmp/lock.file
