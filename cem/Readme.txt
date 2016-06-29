***************************************************************
           CEMExportTool Readme File  
                Version 9.1.0.0
                November 26, 2010
***************************************************************

Copyright (c) 2007-2010 CA. All rights reserved.


*****************************************************************
Contents
*****************************************************************
1.0 Introduction
The Wily CEM data export tool uses the Wily CEM Web Services API to retrieve business process (business service) and business transaction statistics data, as well as defect and incident data from Wily CEM. You can easily import the resulting CSV data into any spreadsheet or reporting tool such as Microsoft Excel, Business Objects, SAS, or Crystal Reports.

2.0 Installation
        2.1 System Requirements
                Wily Customer Experience Manager (CEM) 9.0.5.0 or higher.
                Java Sun SDK 1.5 or higher.
        2.2 Set Up
                Unzip CEMExportTool.zip into any directory. Contents are 
                * 1. CEMExportTool.jar
                * 2. lib
                * 3. Readme.txt
3.0 Usage
To use the CEMExport tool, 
a) Open a command shell.

b) CD to the directory where CEMExportTool was unzipped.

c) Type the CEMExportTool command. (Make sure Java is in your execution PATH. If not, specify the fully qualified path for the Java executable.)
java -jar CEMExportTool.jar -host <cem-em-hostname> -username <cem-webservices-username> -password <cem-webservices-password> -port <cem-webservices-port> -command <export-command-number> -output <output-file> <command-specific-parameters>
                * -host: Wily CEM EM (formerly TESS) hostname
                * -username: Wily CEM webservices login username
                * -password: Wily CEM webservices password
                * -port: CEM webservices port
                * -command: Data export command number. There are 50 possible commands.

Note: As of the CA Wily APM 9.0 release, “business process” in Wily CEM changed to “business service” and “application” in Wily CEM changed to “business application.” To maintain backward compatibility, the Wily CEM Web Services API has not been changed to reflect the new terminology.

3.1 Command descriptions
                                        1: Get all business process (business service) statistics data in a time range.
                                        2: Get all business transaction statistics data in a time range.
                                        3: Get business process (business service) statistics data for a specified business process (business service) in a time range.
                                        4: Get business transaction statistics data for a specified business transaction in a time range.
                                        5: Get business process (business service) statistics data for a specified user group in a time range.
                                        6: Get business transaction statistics data for a specified user group in a time range.
                                        7: Get business process (business service) statistics data for a specified business process (business service) and user group in a time range.
                                        8: Get business transaction statistics data for a specified business transaction and user group in a time range.
                                        9: Get business transaction statistics data for a specified business process (business service), business transaction and user group in a time range.
                                        10: Get defects for a specified business process (business service) in a time range.
                                        11: Get defects for a specified business transaction in a time range.
                                        12: Get defects for a specified user group in a time range.
                                        13: Get defects for a specified defect type in a time range.
                                        14: Get defects for a specified business process (business service), business transaction and user group and defect type in a time range.
                                        15: Get Incidents in a time range.
                                        16: Get business process (business service) statistics data for a specified business application in a time range.
                                        17: Get business transaction statistics data for a specified business application in a time range.
                                        18: Get business process (business service) statistics data for a specified business application and user group in a time range.
                                        19: Get business transaction statistics data for a specified business application and user group in a time range.
                                        20: Close a specified Incident with optional comments.
                                            Only an incident in Open status can be closed. Note: there is no output file from this command.
                                        21: Get aggregated business process (business service) statistics data for all the business processes (business services) in a time range.
                                            This command returns one row of data per business process (business service) for the given time range.
                                        22: Get aggregated business transaction statistics data for all the business transactions in a time range.
                                            This command returns one row of data per business transaction for the given time range.
                                        23: Get aggregated business process (business service) statistics data for a specified business process (business service) in a time range.
                                            This command returns only one row of data for the specified business process (business service) in the given time range.
                                        24: Get aggregated business transaction statistics data for a specified business transaction in a time range.
                                             This command returns only one row of data for the specified business transaction in the given time range. 
                                        25: Get aggregated business process (business service) statistics data for a specified user group in a time range.
                                             This command returns one row of data per business process (business service) in the specified user group for the given time range.
                                        26: Get aggregated business transaction statistics data for a specified user group in a time range.
                                             This command returns one row of data per business transaction in the specified user group for the given time range.
                                        27: Get aggregated business process (business service) statistics data for a specified business process (business service) and user group in a time range.
                                            This command returns only one row of data for the specified the business process (business service) in the specified user group for the given time range.
                                        28: Get aggregated business transaction statistics data for a specified business transaction and user group in a time range.
                                             This command returns only one row of data for the specified business transaction in the specified user group for the given time range.        
                                        29: Get aggregated business transaction statistics data for a specified business process (business service), business transaction and user group in a time range.
                                            This command returns only one row of data for the specified business transaction in the specified business process (business service) and user group for the given time range.
                                        30: Get aggregated business process (business service) statistics data for a specified business application in a time range.
                                            This command returns one row of data per business process (business service) in the specified business application for the given time range.
                                        31: Get aggregated business transaction statistics data for a specified business application in a time range.
                                            This command returns one row of data per business transaction in the specified business application for the given time range.
                                        32: Get aggregated business process (business service) statistics data for a specified business application and user group in a time range.
                                            This command returns one row of data per business process (business service) in the specified business application and user group for the given time range.
                                        33: Get aggregated business transaction statistics data for a specified business application and user group in a time range.
                                            This command returns one row of data per business transaction in the specified business application and user group for the given time range.
                                        34: Get aggregated business process (business service) statistics data for a specified user in a time range.
                                            This command returns one row of data per business process (business service) for the specified user for the given time range.
                                        35: Get aggregated business transaction statistics data for a specified user in a time range.
                                            This command returns one row of data per business transaction for the specified user for the given time range.
                                        36. Get defects for a specified business application in a time range.
                                        37. Get defects that happened in the last X minutes in the system.
                                        38. Get defects that happened in the last X minutes for a specified business application.
                                        39. Get defects that happened in the last X minutes for a specified business process (business service).
                                        40. Get defects that happened in the last X minutes for a specified business transaction.
                                        41. Get the last N defects in the system.
                                        42. Get the last N defects for a specified business application.
                                        43. Get the last N defects for a specified business process (business service).
                                        44. Get the last N defects for a specified business transaction.
					45. Get the content error defects with a value for a specified business process (business service) in a time range.
					46. Get the content error defects with a value for a specified business application in a time range.
					47. Get the content error defects with a value for a specified business transaction in a time range.
					48. Get the content error defects with a value that happened in the last X minutes for a specified business process (business service).
					49. Get the content error defects with a value that happened in the last X minutes for a specified business application.
					50. Get the content error defects with a value that happened in the last X minutes for a specified business transaction.
					
					


                * -output: File name where data is exported to.
Different export commands can have different parameters specific to them.
                * -interval: statistics data aggregation type. 
                                        1: Hourly
                                        2: Daily
                                        3: Weekly
                                        4: Monthly
                * -start: query data start time
                * -end: query data end time
                * -appname: a business application name
                * -bpname: a business process (business service) name
                * -btname: a business transaction name
                * -usergroup: a user group name
                * -dtype: defect type
                                        1: slow time
                                        2: fast time
                                        3: high throughput
                                        4: low throughput
                                        5: large size
                                        6: small size
                                        8: http status code
                                        9: missing transaction/component
                                        10: content error
                                        11: missing response
                                        16: partial response
                * -pthroughput: percentiles of transaction throughput. Multiple percentiles must be separated by ";",
                                such as "-pthroughput 0.25;0.5;0.75". If "-pthroughput all" is specified, then all 
                                the percentiles from 5% - 95% incremented by 5% will be included. If you do not 
                                give any percentile value for statistic data, the default percentile used for
                                transaction throughput is 50%.
                * -psize: percentiles of transaction size. Multiple percentiles must be separated by ";",
                          such as "-psize 0.25;0.5;0.75". If "-psize all" is specified, then all 
                                the percentiles from 5% - 95% incremented by 5% will be included. If you do not 
                                give any percentile value for statistic data, the default percentile used for
                                transaction size is 50%.
                * -ptime: percentiles of transaction time. Multiple percentiles must be separated by ";",
                          such as "-ptime 0.25;0.5;0.75". If "-ptime all" is specified, then all 
                                the percentiles from 5% - 95% incremented by 5% will be included. If you do not 
                                give any percentile value for statistic data, the default percentile used for
                                transaction time is 50%.
                * -metakeys: the defect meta keys which the values are to be retrieved as part of the defect data. 
                             Mulitple keys must be separated by ";". The keys are case-sensitive. 
                             This parameter is optional.
                * -includecomptiminginfo: to include the component breakdown timing information for a defective
                                          business transaction. This parameter is optional.
                * -lastxminutes: the number of minutes within which the defects happened.
                * -lastndefects: the number of defects that happened most recently.
                * -incidentid: the ID of the incident.
		* -contentvalue: String value given in the condition of content error defect.
        
3.2 Command usage and examples
Here is the usage for all the different commands and their specific parameters:
        1: Get all business process (business service) statistics data in a time range.
                Command-specific parameters: -interval -start -end -pthroughput(optional) -psize(optional) -ptime(optional)
                For example:
                java -jar CEMExportTool.jar -host cembox -username username -password password -port 8081 -command 1 -output data.csv -interval 3 -start "1/01/2010 00:00:00" -end "3/15/2010 23:59:00"

        2: Get all business transaction statistics data in a time range.
                Command-specific parameters: -interval -start -end -pthroughput(optional) -psize(optional) -ptime(optional)
                For example:
                java -jar CEMExportTool.jar -host cembox -username username -password password -port 8081 -command 2 -output data.csv -interval 3 -start "1/01/2010 00:00:00" -end "3/15/2010 23:59:00"

        3: Get business process (business service) statistics data for a specified business process (business service) in a time range.
                Command-specific parameters: -interval -start -end -bpname -pthroughput(optional) -psize(optional) -ptime(optional)
                For example:
                java -jar CEMExportTool.jar -host cembox -username username -password password -port 8081 -command 3 -output data.csv -interval 3 -start "1/01/2010 00:00:00" -end "3/15/2010 23:59:00" -bpname "StockTrading"

        4: Get business transaction statistics data for a specified business transaction in a time range.
                Command-specific parameters: -interval -start -end -btname -pthroughput(optional) -psize(optional) -ptime(optional)
                For example:
                java -jar CEMExportTool.jar -host cembox -username username -password password -port 8081 -command 4 -output data.csv -interval 3 -start "1/01/2010 00:00:00" -end "3/15/2010 23:59:00" -btname "Login"

        5: Get business process (business service) statistics data for a specified user group in a time range.
                Command-specific parameters: -interval -start -end -usergroup -pthroughput(optional) -psize(optional) -ptime(optional)
                For example:
                java -jar CEMExportTool.jar -host cembox -username username -password password -port 8081 -command 5 -output data.csv -interval 3 -start "1/01/2010 00:00:00" -end "3/15/2010 23:59:00" -usergroup "North America Users"

        6: Get business transaction statistics data for a specified user group in a time range.
                Command-specific parameters: -interval -start -end -usergroup -pthroughput(optional) -psize(optional) -ptime(optional)
                For example:
                java -jar CEMExportTool.jar -host cembox -username username -password password -port 8081 -command 6 -output data.csv -interval 3 -start "1/01/2010 00:00:00" -end "3/15/2010 23:59:00" -usergroup "North America Users"

        7: Get business process (business service) statistics data for a specified business process (business service), user group in a time range.
                Command-specific parameters: -interval -start -end -bpname -usergroup -pthroughput(optional) -psize(optional) -ptime(optional)
                For example:
                java -jar CEMExportTool.jar -host cembox -username username -password password -port 8081 -command 7 -output data.csv -interval 3 -start "1/01/2010 00:00:00" -end "3/15/2010 23:59:00" -bpname "StockTrading" -usergroup "North America Users"

        8: Get business transaction statistics data for a specified business transaction, user group in a time range.
                Command-specific parameters: -interval -start -end -btname -usergroup -pthroughput(optional) -psize(optional) -ptime(optional)
                For example:
                java -jar CEMExportTool.jar -host cembox -username username -password password -port 8081 -command 8 -output data.csv -interval 3 -start "1/01/2010 00:00:00" -end "3/15/2010 23:59:00" -btname "Login" -usergroup "North America Users"

        9: Get business transaction statistics data for a specified business process (business service), business transaction, user group in a time range.
                Command-specific parameters: -interval -start -end -btname -bpname -usergroup -pthroughput(optional) -psize(optional) -ptime(optional)
                For example:
                java -jar CEMExportTool.jar -host cembox -username username -password password -port 8081 -command 9 -output data.csv -interval 3 -start "1/01/2010 00:00:00" -end "3/15/2010 23:59:00" -bpname "StockTrading" -btname Login -usergroup "North America Users"

        10: Get defects for a specified business process (business service) in a time range.
                Command-specific parameters: -start -end -bpname -metakeys(optional) -includecomptiminginfo(optional)
                For example:
                java -jar CEMExportTool.jar -host cembox -username username -password password -port 8081 -command 10 -output data.csv -start "1/01/2010 00:00:00" -end "3/15/2010 23:59:00" -bpname "StockTrading"

        11: Get defects for a specified business transaction in a time range.
                Command-specific parameters: -start -end -btname -metakeys(optional) -includecomptiminginfo(optional)
                For example:
                java -jar CEMExportTool.jar -host cembox -username username -password password -port 8081 -command 11 -output data.csv -start "1/01/2010 00:00:00" -end "3/15/2010 23:59:00" -btname "Login"

        12: Get defects for a specified user group in a time range.
                Command-specific parameters: -start -end -usergroup -metakeys(optional) -includecomptiminginfo(optional)
                For example:
                java -jar CEMExportTool.jar -host cembox -username username -password password -port 8081 -command 12 -output data.csv -start "1/01/2010 00:00:00" -end "3/15/2010 23:59:00" -usergroup "North America Users"

        13: Get defects for a specified defect type in a time range.
                Command-specific parameters: -start -end -dtype -metakeys(optional) -includecomptiminginfo(optional)
                For example:
                java -jar CEMExportTool.jar -host cembox -username username -password password -port 8081 -command 13 -output data.csv -start "1/01/2010 00:00:00" -end "3/15/2010 23:59:00" -dtype 2

        14: Get defects for a specified business process (business service), business transaction, user group and defect type in a time range.
                Command-specific parameters: -start -end -bpname -btname -usergroup -dtype -metakeys(optional) -includecomptiminginfo(optional)
                For example:
                java -jar CEMExportTool.jar -host cembox -username username -password password -port 8081 -command 14 -output data.csv -start "1/01/2010 00:00:00" -end "3/15/2010 23:59:00" -bpname "StockTrading" -btname "Login" -usergroup "North America Users" -dtype 2

        15: Get Incidents in a time range.
                Command-specific parameters: -start -end
                For example:
                java -jar CEMExportTool.jar -host cembox -username username -password password -port 8081 -command 15 -output data.csv -start "1/01/2010 00:00:00" -end "3/15/2010 23:59:00"

        16: Get business process (business service) statistics data for a specified business application in a time range.
                Command-specific parameters: -interval -start -end -appname -pthroughput(optional) -psize(optional) -ptime(optional)
                For example:
                java -jar CEMExportTool.jar -host cembox -username username -password password -port 8081 -command 16 -output data.csv -interval 2 -start "1/01/2010 00:00:00" -end "3/15/2010 23:59:00" -appname "StockTradingApplication"

        17: Get business transaction statistics data for a specified business application in a time range.
                Command-specific parameters: -interval -start -end -appname -pthroughput(optional) -psize(optional) -ptime(optional)
                For example:
                java -jar CEMExportTool.jar -host cembox -username username -password password -port 8081 -command 17 -output data.csv -interval 2 -start "1/01/2010 00:00:00" -end "3/15/2010 23:59:00" -appname "StockTradingApplication"

        18: Get business process (business service) statistics data for a specified business application and user group in a time range.
                Command-specific parameters: -interval -start -end -appname -usergroup -pthroughput(optional) -psize(optional) -ptime(optional)
                For example:
                java -jar CEMExportTool.jar -host cembox -username username -password password -port 8081 -command 18 -output data.csv -interval 3 -start "1/01/2010 00:00:00" -end "3/15/2010 23:59:00" -appname "StockTradingApplication" -usergroup "North America Users"

        19: Get business transaction statistics data for a specified business application and user group in a time range.
                Command-specific parameters: -interval -start -end -appname -usergroup -pthroughput(optional) -psize(optional) -ptime(optional)
                For example:
                java -jar CEMExportTool.jar -host cembox -username username -password password -port 8081 -command 19 -output data.csv -interval 3 -start "1/01/2010 00:00:00" -end "3/15/2010 23:59:00" -appname "StockTradingApplication" -usergroup "North America Users"
        
        20: Close a specified Incident.
                Command-specific parameters: -incidentid -comments(optional)
                For example:
                java -jar CEMExportTool.jar -host cembox -username username -password password -port 8081 -command 20 -incidentid 1 -comments "Closed from CEMExportTool by someone"

        21: Get aggregated business process (business service) statistics data for all the business processes (business services) in a time range.
                Command-specific parameters: -start -end -pthroughput(optional) -psize(optional) -ptime(optional)
                Note: If the start date and end date are not on the same day, the hour in the start date will be adjusted to 00:00:00 and the hour in the end date will be adjusted to 23:59:59
                For example 1:
                java -jar CEMExportTool.jar -host cembox -username username -password password -port 8081 -command 21 -output data.csv -start "1/01/2010 00:00:00" -end "3/15/2010 23:59:00" 
                For example 2:            
                java -jar CEMExportTool.jar -host cembox -username username -password password -port 8081 -command 21 -output data.csv -start "3/15/2010 08:00:00" -end "3/15/2010 17:59:00"  

        22: Get aggregated business transaction statistics data for all the business transactions in a time range.
                Command-specific parameters: -start -end -pthroughput(optional) -psize(optional) -ptime(optional)
                Note: If the start date and end date are not on the same day, the hour in the start date will be adjusted to 00:00:00 and the hour in the end date will be adjusted to 23:59:59
                For example 1:
                java -jar CEMExportTool.jar -host cembox -username username -password password -port 8081 -command 22 -output data.csv -start "1/01/2010 00:00:00" -end "3/15/2010 23:59:00"
                For example 2:
                java -jar CEMExportTool.jar -host cembox -username username -password password -port 8081 -command 22 -output data.csv -start "3/15/2010 08:00:00" -end "3/15/2010 17:59:00"

        23: Get aggregated business process (business service) statistics data for a specified business process (business service) in a time range.
                Command-specific parameters: -start -end -bpname -pthroughput(optional) -psize(optional) -ptime(optional)
                Note: If the start date and end date are not on the same day, the hour in the start date will be adjusted to 00:00:00 and the hour in the end date will be adjusted to 23:59:59
                For example 1:
                java -jar CEMExportTool.jar -host cembox -username username -password password -port 8081 -command 23 -output data.csv -start "1/01/2010 00:00:00" -end "3/15/2010 23:59:00" -bpname "StockTrading"
                For example 2:
                 java -jar CEMExportTool.jar -host cembox -username username -password password -port 8081 -command 23 -output data.csv -start "3/15/2010 08:00:00" -end "3/15/2010 17:59:00" -bpname "StockTrading"

        24: Get aggregated business transaction statistics data for a specified business transaction in a time range.
                Command-specific parameters: -start -end -btname -pthroughput(optional) -psize(optional) -ptime(optional)
                Note: If the start date and end date are not on the same day, the hour in the start date will be adjusted to 00:00:00 and the hour in the end date will be adjusted to 23:59:59
                For example 1:
                java -jar CEMExportTool.jar -host cembox -username username -password password -port 8081 -command 24 -output data.csv -start "1/01/2010 00:00:00" -end "3/15/2010 23:59:00" -btname "Login"
                For example 2:
                java -jar CEMExportTool.jar -host cembox -username username -password password -port 8081 -command 24 -output data.csv -start "3/15/2010 08:00:00" -end "3/15/2010 17:59:00" -btname "Login"

        25: Get aggregated business process (business service) statistics data for a specified user group in a time range.
                Command-specific parameters: -start -end -usergroup -pthroughput(optional) -psize(optional) -ptime(optional)
                Note: If the start date and end date are not on the same day, the hour in the start date will be adjusted to 00:00:00 and the hour in the end date will be adjusted to 23:59:59
                For example 1:
                java -jar CEMExportTool.jar -host cembox -username username -password password -port 8081 -command 25 -output data.csv -start "1/01/2010 00:00:00" -end "3/15/2010 23:59:00" -usergroup "North America Users"
                For example 2:
                java -jar CEMExportTool.jar -host cembox -username username -password password -port 8081 -command 25 -output data.csv -start "3/15/2010 00:00:00" -end "3/15/2010 23:59:00" -usergroup "North America Users"

        26: Get aggregated business transaction statistics data for a specified user group in a time range.
                Command-specific parameters: -start -end -usergroup -pthroughput(optional) -psize(optional) -ptime(optional)
                Note: If the start date and end date are not on the same day, the hour in the start date will be adjusted to 00:00:00 and the hour in the end date will be adjusted to 23:59:59
                For example 1:
                java -jar CEMExportTool.jar -host cembox -username username -password password -port 8081 -command 26 -output data.csv -start "1/01/2010 00:00:00" -end "3/15/2010 23:59:00" -usergroup "North America Users"
                For example 2:
                java -jar CEMExportTool.jar -host cembox -username username -password password -port 8081 -command 26 -output data.csv -start "3/15/2010 08:00:00" -end "3/15/2010 17:59:00" -usergroup "North America Users"

        27: Get aggregated business process (business service) statistics data for a specified business process (business service) and user group in a time range.
                Command-specific parameters: -start -end -bpname -usergroup -pthroughput(optional) -psize(optional) -ptime(optional)
                Note: If the start date and end date are not on the same day, the hour in the start date will be adjusted to 00:00:00 and the hour in the end date will be adjusted to 23:59:59
                For example 1:
                java -jar CEMExportTool.jar -host cembox -username username -password password -port 8081 -command 27 -output data.csv -start "1/01/2010 00:00:00" -end "3/15/2010 23:59:00" -bpname "StockTrading" -usergroup "North America Users"
                For example 2:
                java -jar CEMExportTool.jar -host cembox -username username -password password -port 8081 -command 27 -output data.csv -start "3/15/2010 08:00:00" -end "3/15/2010 17:59:00" -bpname "StockTrading" -usergroup "North America Users"

        28: Get aggregated business transaction statistics data for a specified business transaction and user group in a time range.
                Command-specific parameters: -interval -start -end -btname -usergroup -pthroughput(optional) -psize(optional) -ptime(optional)
                Note: If the start date and end date are not on the same day, the hour in the start date will be adjusted to 00:00:00 and the hour in the end date will be adjusted to 23:59:59
                For example 1:
                java -jar CEMExportTool.jar -host cembox -username username -password password -port 8081 -command 28 -output data.csv -start "1/01/2010 00:00:00" -end "3/15/2010 23:59:00" -btname "Login" -usergroup "North America Users"
                For example 2:
                java -jar CEMExportTool.jar -host cembox -username username -password password -port 8081 -command 28 -output data.csv -start "3/15/2010 08:00:00" -end "3/15/2010 17:59:00" -btname "Login" -usergroup "North America Users"

        29: Get aggregated business transaction statistics data for a specified business process (business service), business transaction and user group in a time range.
                Command-specific parameters: -start -end -btname -bpname -usergroup -pthroughput(optional) -psize(optional) -ptime(optional)
                Note: If the start date and end date are not on the same day, the hour in the start date will be adjusted to 00:00:00 and the hour in the end date will be adjusted to 23:59:59
                For example 1:
                java -jar CEMExportTool.jar -host cembox -username username -password password -port 8081 -command 29 -output data.csv -start "1/01/2010 00:00:00" -end "3/15/2010 23:59:00" -bpname "StockTrading" -btname Login -usergroup "North America Users"
                 For example 2:
                java -jar CEMExportTool.jar -host cembox -username username -password password -port 8081 -command 29 -output data.csv -start "3/15/2010 08:00:00" -end "3/15/2010 17:59:00" -bpname "StockTrading" -btname Login -usergroup "North America Users"

        30: Get aggregated business process (business service) statistics data for a specified business application in a time range.
                Command-specific parameters: -start -end -appname -pthroughput(optional) -psize(optional) -ptime(optional)
                Note: If the start date and end date are not on the same day, the hour in the start date will be adjusted to 00:00:00 and the hour in the end date will be adjusted to 23:59:59
                For example 1:
                java -jar CEMExportTool.jar -host cembox -username username -password password -port 8081 -command 30 -output data.csv -start "1/01/2010 00:00:00" -end "3/15/2010 23:59:00" -appname "StockTradingApplication"
                For example 2:
                java -jar CEMExportTool.jar -host cembox -username username -password password -port 8081 -command 30 -output data.csv -start "3/15/2010 08:00:00" -end "3/15/2010 17:59:00" -appname "StockTradingApplication"

        31: Get aggregated business transaction statistics data for a specified business application in a time range.
                Command-specific parameters: -start -end -appname -pthroughput(optional) -psize(optional) -ptime(optional)
                Note: If the start date and end date are not on the same day, the hour in the start date will be adjusted to 00:00:00 and the hour in the end date will be adjusted to 23:59:59
                For example 1:
                java -jar CEMExportTool.jar -host cembox -username username -password password -port 8081 -command 31 -output data.csv -start "1/01/2010 00:00:00" -end "3/15/2010 23:59:00" -appname "StockTradingApplication"
                For example 2:
                java -jar CEMExportTool.jar -host cembox -username username -password password -port 8081 -command 31 -output data.csv -start "3/15/2010 08:00:00" -end "3/15/2010 17:59:00" -appname "StockTradingApplication"

        32: Get aggregated business process (business service) statistics data for a specified business application and user group in a time range.
                Command-specific parameters: -start -end -appname -usergroup -pthroughput(optional) -psize(optional) -ptime(optional)
                Note: If the start date and end date are not on the same day, the hour in the start date will be adjusted to 00:00:00 and the hour in the end date will be adjusted to 23:59:59
                For example 1:
                java -jar CEMExportTool.jar -host cembox -username username -password password -port 8081 -command 32 -output data.csv -start "1/01/2010 00:00:00" -end "3/15/2010 23:59:00" -appname "StockTradingApplication" -usergroup "North America Users"
                For example 2:
                java -jar CEMExportTool.jar -host cembox -username username -password password -port 8081 -command 32 -output data.csv -start "3/15/2010 08:00:00" -end "3/15/2010 17:59:00" -appname "StockTradingApplication" -usergroup "North America Users"

        33: Get aggregated business transaction statistics data for a specified business application and user group in a time range.
                Command-specific parameters: -start -end -appname -usergroup -pthroughput(optional) -psize(optional) -ptime(optional)
                Note: If the start date and end date are not on the same day, the hour in the start date will be adjusted to 00:00:00 and the hour in the end date will be adjusted to 23:59:59
                For example 1:
                java -jar CEMExportTool.jar -host cembox -username username -password password -port 8081 -command 33 -output data.csv -start "1/01/2010 00:00:00" -end "3/15/2010 23:59:00" -appname "StockTradingApplication" -usergroup "North America Users"
                For example 2:
                java -jar CEMExportTool.jar -host cembox -username username -password password -port 8081 -command 33 -output data.csv -start "3/15/2010 08:00:00" -end "3/15/2010 17:59:00" -appname "StockTradingApplication" -usergroup "North America Users"

        34: Get aggregated business process (business service) statistics data for a specified user in a time range.
                Command-specific parameters: -start -end -user -pthroughput(optional) -psize(optional) -ptime(optional)
                Note: If the start date and end date are not on the same day, the hour in the start date will be adjusted to 00:00:00 and the hour in the end date will be adjusted to 23:59:59
                For example 1:
                java -jar CEMExportTool.jar -host cembox -username username -password password -port 8081 -command 34 -output data.csv -start "1/01/2010 00:00:00" -end "3/15/2010 23:59:00" -user "user1"
                For example 2:
                java -jar CEMExportTool.jar -host cembox -username username -password password -port 8081 -command 34 -output data.csv -start "3/15/2010 08:00:00" -end "3/15/2010 17:59:00" -user "user1"

        35: Get aggregated business transaction statistics data for a specified user in a time range.
                Command-specific parameters: -start -end -user -pthroughput(optional) -psize(optional) -ptime(optional)
                Note: If the start date and end date are not on the same day, the hour in the start date will be adjusted to 00:00:00 and the hour in the end date will be adjusted to 23:59:59
                For example 1:
                java -jar CEMExportTool.jar -host cembox -username username -password password -port 8081 -command 35 -output data.csv -start "1/01/2010 00:00:00" -end "3/15/2010 23:59:00" -user "user1"
                For example 2:
                java -jar CEMExportTool.jar -host cembox -username username -password password -port 8081 -command 35 -output data.csv -start "3/15/2010 08:00:00" -end "3/15/2010 17:59:00" -user "user1"

        36: Get defects for a specified business application in a time range.
                Command-specific parameters: -start -end -appname -metakeys(optional) -includecomptiminginfo(optional)
                For example:
                java -jar CEMExportTool.jar -host cembox -username username -password password -port 8081 -command 36 -output data.csv -start "1/01/2010 00:00:00" -end "3/15/2010 23:59:00" -appname "StockTradingApplication"

        37. Get defects that happened in the last X minutes in the system.
                Command-specific parameters: -lastxminutes -metakeys(optional) -includecomptiminginfo(optional)
                For example:
                java -jar CEMExportTool.jar -host cembox -username username -password password -port 8081 -command 37 -output data.csv -lastxminutes 5

        38. Get defects that happened in the last X minutes for a specified business application.
                Command-specific parameters: -lastxminutes -appname -metakeys(optional) -includecomptiminginfo(optional)
                For example:
                java -jar CEMExportTool.jar -host cembox -username username -password password -port 8081 -command 38 -output data.csv -lastxminutes 5 -appname "StockTradingApplication"

        39. Get defects that happened in the last X minutes for a specified business process (business service).
                Command-specific parameters: -lastxminutes -bpname -metakeys(optional) -includecomptiminginfo(optional)
                For example:
                java -jar CEMExportTool.jar -host cembox -username username -password password -port 8081 -command 39 -output data.csv -lastxminutes 5 -bpname "StockTrading"

        40. Get defects that happened in the last X minutes for a specified business transaction.
                Command-specific parameters: -lastxminutes -btname -metakeys(optional) -includecomptiminginfo(optional)
                For example:
                java -jar CEMExportTool.jar -host cembox -username username -password password -port 8081 -command 40 -output data.csv -lastxminutes 5 -btname "Login"

        41. Get the last N defects in the system.
                Command-specific parameters: -lastndefects -metakeys(optional) -includecomptiminginfo(optional)
                For example:
                java -jar CEMExportTool.jar -host cembox -username username -password password -port 8081 -command 41 -output data.csv -lastndefects 15

        42. Get the last N defects for a specified business application.
                Command-specific parameters: -lastndefects -appname -metakeys(optional) -includecomptiminginfo(optional)
                For example:
                java -jar CEMExportTool.jar -host cembox -username username -password password -port 8081 -command 42 -output data.csv -lastndefects 15 -appname "StockTradingApplication"

        43. Get the last N defects for a specified business process (business service).
                Command-specific parameters: -lastndefects -bpname -metakeys(optional) -includecomptiminginfo(optional)
                For example:
                java -jar CEMExportTool.jar -host cembox -username username -password password -port 8081 -command 43 -output data.csv -lastndefects 15 -bpname "StockTrading"

        44. Get the last N defects for a specified business transaction.
                Command-specific parameters: -lastndefects -btname -metakeys(optional) -includecomptiminginfo(optional)
                For example:
                java -jar CEMExportTool.jar -host cembox -username username -password password -port 8081 -command 44 -output data.csv -lastndefects 15 -btname "Login"
 
	45. Get the content error defects with a value for a specified business process (business service) in a time range.
		Command-specific parameters: -contentvalue -start -end -bpname -metakeys(optional) 
		For example:		
		java -jar CEMExportTool.jar -host cembox -username username -password password -port 8081 -command 45 -output data.csv  -start "1/01/2010 00:00:00" -end "3/15/2010 23:59:00" -contentvalue "Operation Failed" -bpname "StockTrading"
		
	46. Get the content error defects with a value for a specified business application in a time range.
		Command-specific parameters: -contentvalue -start -end -appname -metakeys(optional) 
		For example:
		java -jar CEMExportTool.jar -host cembox -username username -password password -port 8081 -command 46 -output data.csv  -start "1/01/2010 00:00:00" -end "3/15/2010 23:59:00"  -contentvalue "Operation Failed" -appname "StockTradingApplication"

	47. Get the content error defects with a value for a specified business transaction in a time range.
		Command-specific parameters: -contentvalue -start -end -btname -metakeys(optional) 
		For example:
		java -jar CEMExportTool.jar -host cembox -username username -password password -port 8081 -command 47 -output data.csv  -start "1/01/2010 00:00:00" -end "3/15/2010 23:59:00"  -contentvalue "Operation Failed" -btname "Login"

	48. Get the content error defects with a value that happened in the last X minutes for a specified business process (business service).
		Command-specific parameters: -contentvalue -lastxminutes -bpname -metakeys(optional) 
		For example:
		java -jar CEMExportTool.jar -host cembox -username username -password password -port 8081 -command 48 -output data.csv  -lastxminutes 20  -contentvalue "Operation Failed" -bpname "StockTrading"

	49. Get the content error defects with a value that happened in the last X minutes for a specified business application.
		Command-specific parameters: -contentvalue -lastxminutes -appname -metakeys(optional) 
		For example:
		java -jar CEMExportTool.jar -host cembox -username username -password password -port 8081 -command 49 -output data.csv  -lastxminutes 20  -contentvalue "Operation Failed" -appname "StockTradingApplication"			

	50. Get the content error defects with a value that happened in the last X minutes for a specified business transaction.
		Command-specific parameters: -contentvalue -lastxminutes -btname -metakeys(optional) 
		For example:
		java -jar CEMExportTool.jar -host cembox -username username -password password -port 8081 -command 50 -output data.csv  -lastxminutes 20  -contentvalue "Operation Failed" -btname "Login"

	
