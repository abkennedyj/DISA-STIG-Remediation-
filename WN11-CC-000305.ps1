<#
.SYNOPSIS
   Indexing of encrypted files has been disabled.
   
.NOTES
    Author          : Josiah Kennedy
    LinkedIn        : linkedin.com/in/josiahtakyi/
    GitHub          : github.com/abkennedyj
    Date Created    : 2026-07-27
    Last Modified   : 2024-07-27
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-CC-000305
    Documentation   : https://stigaview.com/products/win11/v2r7/WN11-CC-000305/

.TESTED ON
    Date(s) Tested  : 2026-07-27
    Tested By       : Josiah Kennedy
    Systems Tested  : Windows 11 
    PowerShell Ver. : 5.1

.USAGE
    Run script As Admin in PowerShell 
    PS C:\> .\WN11-CC-000305.ps1
#>

# Ensure the registry path exists
New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Windows Search" -Force | Out-Null

# Disable indexing of encrypted files
New-ItemProperty `
    -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Windows Search" `
    -Name "AllowIndexingEncryptedStoresOrItems" `
    -PropertyType DWord `
    -Value 0 `
    -Force | Out-Null

Write-Host "Indexing of encrypted files has been disabled."
