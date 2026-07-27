<#
.SYNOPSIS
    Autoplay must be turned off for non-volume devices.

.NOTES
    Author          : JosiahKennedy
    LinkedIn        : linkedin.com/in/josiahtakyi/
    GitHub          : github.com/abkennedyj
    Date Created    : 2026-07-27
    Last Modified   : 2024-07-27
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-CC-000180
    Documentation   : https://stigaview.com/products/win11/v2r7/WN11-CC-000180/

.TESTED ON
    Date(s) Tested  : 2026-07-27
    Tested By       : Josiah Kennedy
    Systems Tested  : Windows 11 
    PowerShell Ver. : 5.1

.USAGE
    Run script As Admin in PowerShell 
    PS C:\> .\WN11-CC-000180.ps1
#>

$Path = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Explorer"

# Create registry path if missing
New-Item -Path $Path -Force | Out-Null

# Disable AutoPlay for non-volume devices
New-ItemProperty `
    -Path $Path `
    -Name "NoAutoplayfornonVolume" `
    -PropertyType DWord `
    -Value 1 `
    -Force | Out-Null

Write-Host "WN11-CC-000180 applied: AutoPlay disabled for non-volume devices." -ForegroundColor GreenE
