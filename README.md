# SpeedTest
Seriously this is so cool. There is nothing I hate more than when you go online to do a speedtest and it seems the page loading the speedtest is taking to long then there is so many different speedtest sites out there, and well how good are they? As always I hate leaving the comfort of my own shell so I don't (except for when I have to). This is a world class speedtest from Ookla bringing you all the amazing features in your Powershell terminal.

```powershell
.SYNOPSIS
Speedtest-CLI by Ookla

.DESCRIPTION 
Allows you to run super cool speed tests from powershell command line

.PARAMETER Unit
Output unit for displaying speeds default is Mbps

.PARAMETER ListNearestServers
Shows a list of the nearest speedtest servers should you wish to select a specific one


.PARAMETER ServerID
Specify a server from the server list using its id


.PARAMETER IPaddress
Attempt to bind to the specified IP address when connecting to servers


.PARAMETER Host
Specify a server, from the server list, using its host's fully qualified domain name


.PARAMETER ShowProgress
Enable or disable progress bar (Note: only available for 'human-readable' or 'json' and defaults to yes when interactive)


.PARAMETER Format
Output Format


.PARAMETER ProgressUpdateInterval
Progress update interval (100-1000 milliseconds)


.PARAMETER ShowServerSelection
Show server selection details


.PARAMETER VerboseLogging
Logging verbosity


.PARAMETER OUtputHeader
Show output header for CSV and TSV formats
```
