# SpeedTest
Seriously this is so cool. There is nothing I hate more than when you go online to do a speedtest and it seems the page loading the speedtest is taking to long then there is so many different speedtest sites out there, and well how good are they? As always I hate leaving the comfort of my own shell so I don't (except for when I have to). This is a world class speedtest from Ookla bringing you all the amazing features in your Powershell terminal.

PowerShell Crescendo module for TShark command line of Wireshark.

![](https://img.shields.io/powershellgallery/dt/tshark?style=for-the-badge)

# Installation 

This module does not include the commands that it wraps. You can install them with scoop or Chocolatey. Or if you don't want you copy and paste, I did include a function to install it for you within the module

```powershell
Install-SpeedTest
```
Which will check if scoop present if not will install scoop and speedtest-cli, if scoop is installed it will just install speedtest-cli, if you don't already have it installed

# Manual Install from scoop

```powershell
Invoke-Expression (New-Object System.Net.WebClient).DownloadString('https://get.scoop.sh')
scoop install git
scoop bucket add extras
scoop install speedtest-cli
```
# Manual Install from Chocolatey

```powershell
choco install speedtest-cli
```
# Install this module from PSGallery, or take a fork

To install this module: 

```powershell
Install-Module SpeedTest
```


# Help

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
