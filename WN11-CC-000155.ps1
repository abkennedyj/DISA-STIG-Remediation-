<#
.SYNOPSIS
    Solicited Remote Assistance disabled

.NOTES
    Author          : Josiah Kennedy
    LinkedIn        : linkedin.com/in/josiahtakyi/
    GitHub          : github.com/abkennedyj
    Date Created    : 2026-07-27
    Last Modified   : 2024-07-27
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-CC-000155
    Documentation   : https://stigaview.com/products/win11/v2r7/WN11-CC-000155/

.TESTED ON
    Date(s) Tested  : 2026-07-27
    Tested By       : Josiah Kennedy
    Systems Tested  : Windows 11 
    PowerShell Ver. : 5.1

.USAGE
    Run script As Admin in PowerShell 
    PS C:\> .\WN11-CC-000155.ps1
#>

$Path = "HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services"

# Create registry path if missing
New-Item -Path $Path -Force | Out-Null

# Disable Solicited Remote Assistance
New-ItemProperty `
    -Path $Path `
    -Name "fAllowToGetHelp" `
    -PropertyType DWord `
    -Value 0 `
    -Force | Out-Null

Write-Host "WN11-CC-000155 applied: Solicited Remote Assistance disabled." -ForegroundColor Green
