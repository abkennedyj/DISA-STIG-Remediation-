<#
.SYNOPSIS
    Windows 11 Kernel (Direct Memory Access) DMA Protection must be enabled.

.NOTES
    Author          : JosiahKennedy
    LinkedIn        : linkedin.com/in/josiahtakyi/
    GitHub          : github.com/abkennedyj
    Date Created    : 2026-07-27
    Last Modified   : 2024-07-27
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-EP-000310
    Documentation   : https://stigaview.com/products/win11/v2r7/WN11-EP-000310/

.TESTED ON
    Date(s) Tested  : 2026-07-27
    Tested By       : Josiah Kennedy
    Systems Tested  : Windows 11 
    PowerShell Ver. : 5.1

.USAGE
    Run script As Admin in PowerShell 
    PS C:\> .\WN11-EP-000310.ps1
#>

# Ensure the registry path exists
New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Kernel DMA Protection" -Force | Out-Null

# Configure Enumeration Policy = Block All
New-ItemProperty `
    -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Kernel DMA Protection" `
    -Name "DeviceEnumerationPolicy" `
    -PropertyType DWord `
    -Value 0 `
    -Force | Out-Null
