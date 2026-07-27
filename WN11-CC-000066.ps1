<#
.SYNOPSIS
    Command line data must be included in process creation events.
    
.NOTES
    Author          : JosiahKennedy
    LinkedIn        : linkedin.com/in/josiahtakyi/
    GitHub          : github.com/abkennedyj
    Date Created    : 2026-07-27
    Last Modified   : 2024-07-27
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-CC-000066
    Documentation   : https://stigaview.com/products/win11/v2r7/WN11-CC-000066/

.TESTED ON
    Date(s) Tested  : 2026-07-27
    Tested By       : Josiah Kennedy
    Systems Tested  : Windows 11 
    PowerShell Ver. : 5.1

.USAGE
    Run script As Admin in PowerShell 
    PS C:\> .\WN11-CC-000066.ps1
#>


$Path = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System\Audit"

# Create registry path if missing
New-Item -Path $Path -Force | Out-Null

# Enable command line logging for process creation events
New-ItemProperty `
    -Path $Path `
    -Name "ProcessCreationIncludeCmdLine_Enabled" `
    -PropertyType DWord `
    -Value 1 `
    -Force | Out-Null

Write-Host "WN11-CC-000066 applied successfully." -ForegroundColor Green
