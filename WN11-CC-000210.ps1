<#
.SYNOPSIS
    Ensure the Windows Explorer shell protocol runs in protected mode

.NOTES
    Author          : Josiah Kennedy
    LinkedIn        : linkedin.com/in/josiahtakyi/
    GitHub          : github.com/abkennedyj
    Date Created    : 2026-07-27
    Last Modified   : 2024-07-27
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-CC-000210
    Documentation   : https://stigaview.com/products/win11/v2r7/WN11-CC-000210/

.TESTED ON
    Date(s) Tested  : 2026-07-27
    Tested By       : Josiah Kennedy
    Systems Tested  : Windows 11 
    PowerShell Ver. : 5.1

.USAGE
    Run script As Admin in PowerShell 
    PS C:\> .\WN11-CC-000210.ps1
#>


$Path = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer"
$Name = "PreXPSP2ShellProtocolBehavior"

# Create the registry key if it doesn't exist
if (-not (Test-Path $Path)) {
    New-Item -Path $Path -Force | Out-Null
}

# Enable protected mode behavior for the shell protocol
New-ItemProperty `
    -Path $Path `
    -Name $Name `
    -Value 0 `
    -PropertyType DWord `
    -Force | Out-Null

# Verify the setting
Get-ItemProperty -Path $Path -Name $Name
