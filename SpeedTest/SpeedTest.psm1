# Module created by Microsoft.PowerShell.Crescendo
class PowerShellCustomFunctionAttribute : System.Attribute { 
    [bool]$RequiresElevation
    [string]$Source
    PowerShellCustomFunctionAttribute() { $this.RequiresElevation = $false; $this.Source = "Microsoft.PowerShell.Crescendo" }
    PowerShellCustomFunctionAttribute([bool]$rElevation) {
        $this.RequiresElevation = $rElevation
        $this.Source = "Microsoft.PowerShell.Crescendo"
    }
}



function Start-SpeedTest
{
[PowerShellCustomFunctionAttribute(RequiresElevation=$False)]
[CmdletBinding()]

param(
[Parameter()]
[ValidateSet("bps", "kbps", "Mbps", "Gbps","B/s", "kB/s", "MB/s", "GB/s","kibps", "Mibps", "Gibps", "kiB/s", "MiB/s", "GiB/s")]
[String]$Unit,
[Parameter()]
[Switch]$ListNearestServers,
[Parameter()]
[String]$ServerID,
[Parameter()]
[String]$IPaddress,
[Parameter()]
[String]$Host,
[Parameter()]
[ValidateSet("Yes","No")]
[String]$ShowProgress,
[Parameter()]
[String]$Format,
[Parameter()]
[String]$ProgressUpdateInterval,
[Parameter()]
[Switch]$ShowServerSelection,
[Parameter()]
[Switch]$VerboseLogging,
[Parameter()]
[ValidateSet( "csv", "tsv", "json", "jsonl", "json-pretty")]
[String]$OUtputHeader
    )

BEGIN {
    $__PARAMETERMAP = @{
         Unit = @{
               OriginalName = '-u'
               OriginalPosition = '0'
               Position = '2147483647'
               ParameterType = 'String'
               ApplyToExecutable = $False
               NoGap = $False
               }
         ListNearestServers = @{
               OriginalName = '-L'
               OriginalPosition = '0'
               Position = '2147483647'
               ParameterType = 'Switch'
               ApplyToExecutable = $False
               NoGap = $False
               }
         ServerID = @{
               OriginalName = '-s'
               OriginalPosition = '0'
               Position = '2147483647'
               ParameterType = 'String'
               ApplyToExecutable = $False
               NoGap = $False
               }
         IPaddress = @{
               OriginalName = '-i'
               OriginalPosition = '0'
               Position = '2147483647'
               ParameterType = 'String'
               ApplyToExecutable = $False
               NoGap = $False
               }
         Host = @{
               OriginalName = '-o'
               OriginalPosition = '0'
               Position = '2147483647'
               ParameterType = 'String'
               ApplyToExecutable = $False
               NoGap = $False
               }
         ShowProgress = @{
               OriginalName = '-p'
               OriginalPosition = '0'
               Position = '2147483647'
               ParameterType = 'String'
               ApplyToExecutable = $False
               NoGap = $False
               }
         Format = @{
               OriginalName = '-f'
               OriginalPosition = '0'
               Position = '2147483647'
               ParameterType = 'String'
               ApplyToExecutable = $False
               NoGap = $False
               }
         ProgressUpdateInterval = @{
               OriginalName = '--progress-update-interval='
               OriginalPosition = '0'
               Position = '2147483647'
               ParameterType = 'String'
               ApplyToExecutable = $False
               NoGap = $False
               }
         ShowServerSelection = @{
               OriginalName = '--selection-details'
               OriginalPosition = '0'
               Position = '2147483647'
               ParameterType = 'Switch'
               ApplyToExecutable = $False
               NoGap = $False
               }
         VerboseLogging = @{
               OriginalName = '-v'
               OriginalPosition = '0'
               Position = '2147483647'
               ParameterType = 'Switch'
               ApplyToExecutable = $False
               NoGap = $False
               }
         OUtputHeader = @{
               OriginalName = '--output-header'
               OriginalPosition = '0'
               Position = '2147483647'
               ParameterType = 'String'
               ApplyToExecutable = $False
               NoGap = $False
               }
    }

    $__outputHandlers = @{ Default = @{ StreamOutput = $true; Handler = { $input } } }
}

PROCESS {
    $__boundParameters = $PSBoundParameters
    $__defaultValueParameters = $PSCmdlet.MyInvocation.MyCommand.Parameters.Values.Where({$_.Attributes.Where({$_.TypeId.Name -eq "PSDefaultValueAttribute"})}).Name
    $__defaultValueParameters.Where({ !$__boundParameters["$_"] }).ForEach({$__boundParameters["$_"] = get-variable -value $_})
    $__commandArgs = @()
    $MyInvocation.MyCommand.Parameters.Values.Where({$_.SwitchParameter -and $_.Name -notmatch "Debug|Whatif|Confirm|Verbose" -and ! $__boundParameters[$_.Name]}).ForEach({$__boundParameters[$_.Name] = [switch]::new($false)})
    if ($__boundParameters["Debug"]){wait-debugger}
    $__commandArgs += ''
    #'--accept-license --accept-gdpr'
    foreach ($paramName in $__boundParameters.Keys|
            Where-Object {!$__PARAMETERMAP[$_].ApplyToExecutable}|
            Sort-Object {$__PARAMETERMAP[$_].OriginalPosition}) {
        $value = $__boundParameters[$paramName]
        $param = $__PARAMETERMAP[$paramName]
        if ($param) {
            if ($value -is [switch]) {
                 if ($value.IsPresent) {
                     if ($param.OriginalName) { $__commandArgs += $param.OriginalName }
                 }
                 elseif ($param.DefaultMissingValue) { $__commandArgs += $param.DefaultMissingValue }
            }
            elseif ( $param.NoGap ) {
                $pFmt = "{0}{1}"
                if($value -match "\s") { $pFmt = "{0}""{1}""" }
                $__commandArgs += $pFmt -f $param.OriginalName, $value
            }
            else {
                if($param.OriginalName) { $__commandArgs += $param.OriginalName }
                $__commandArgs += $value | Foreach-Object {$_}
            }
        }
    }
    $__commandArgs = $__commandArgs | Where-Object {$_ -ne $null}
    if ($__boundParameters["Debug"]){wait-debugger}
    if ( $__boundParameters["Verbose"]) {
         Write-Verbose -Verbose -Message speedtest.exe
         $__commandArgs | Write-Verbose -Verbose
    }
    $__handlerInfo = $__outputHandlers[$PSCmdlet.ParameterSetName]
    if (! $__handlerInfo ) {
        $__handlerInfo = $__outputHandlers["Default"] # Guaranteed to be present
    }
    $__handler = $__handlerInfo.Handler
    if ( $PSCmdlet.ShouldProcess("speedtest.exe $__commandArgs")) {
    # check for the application and throw if it cannot be found
        if ( -not (Get-Command -ErrorAction Ignore "speedtest.exe")) {
          throw "Cannot find executable 'speedtest.exe'"
        }
        if ( $__handlerInfo.StreamOutput ) {
            & "speedtest.exe" $__commandArgs | & $__handler
        }
        else {
            $result = & "speedtest.exe" $__commandArgs
            & $__handler $result
        }
    }
  } # end PROCESS

<#
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


#>
}


Function Install-SpeedTest {
if (Test-Path "$env:USERPROFILE\scoop")
{
    Write-Host -ForegroundColor Yellow "Awesome it looks like you have scoop installed, checking to see if speedtest present."
    if (Test-Path "$env:USERPROFILE\scoop\shims\speedtest.exe")
    {
    Write-Host -ForegroundColor Yellow "It appears you have speedtest installed you are all good to use Start-SpeedTest now"
    }
    else {
    scoop install speedtest-cli
    }
}
else
{
Write-Host -ForegroundColor Yellow "I am now installing scoop for you and TShark, then you can use Start-TShark once complete."
Invoke-Expression (New-Object System.Net.WebClient).DownloadString('https://get.scoop.sh')
scoop install git
scoop bucket add extras
scoop install speedtest-cli
Write-Host -ForegroundColor Yellow "All done have a great day."
}

}