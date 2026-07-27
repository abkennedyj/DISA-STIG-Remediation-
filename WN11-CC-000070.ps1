<#
.SYNOPSIS
    Virtualization-based Security must be enabled on Windows 11 with the platform security level configured to Secure Boot or Secure Boot with DMA Protection. 
    
.NOTES
    Author          : JosiahKennedy
    LinkedIn        : linkedin.com/in/josiahtakyi/
    GitHub          : github.com/abkennedyj
    Date Created    : 2026-07-27
    Last Modified   : 2024-07-27
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-CC-000070
    Documentation   : https://stigaview.com/products/win11/v2r7/WN11-CC-000070/

.TESTED ON
    Date(s) Tested  : 2026-07-27
    Tested By       : Josiah Kennedy
    Systems Tested  : Windows 11 
    PowerShell Ver. : 5.1

.USAGE
    Run script As Admin in PowerShell 
    PS C:\> .\WN11-CC-000070.ps1
#>


# Registry path and value name
$Path = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DeviceGuard"
$Name = "RequirePlatformSecurityFeatures"

# Create the registry key if it doesn't exist
if (-not (Test-Path $Path)) {
    New-Item -Path $Path -Force | Out-Null
}

# Require Secure Boot
New-ItemProperty -Path $Path -Name $Name -Value 1 -PropertyType DWord -Force | Out-Null

# Verify the setting
Get-ItemProperty -Path $Path -Name $Name
