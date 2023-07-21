# PowerShell script to enable a driver

# Start PowerShell with Admin rights
if (-NOT ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    Write-Host "You do not have Administrator rights to run this script!`nPlease re-run this script as an Administrator!" -ForegroundColor Red
    exit
}

# Define the name of the driver you want to enable
$driverName = "TEXA Navigator Nano  TCXE01"
$driverName2 = "Sentinel USB Key"

# Get the driver
$driver = Get-PnpDevice | Where-Object { $_.FriendlyName -eq $driverName }
$driver2 = Get-PnpDevice | Where-Object { $_.FriendlyName -eq $driverName2 }

# Enable the driver
Enable-PnpDevice -InstanceId $driver.InstanceId -Confirm:$false
Enable-PnpDevice -InstanceId $driver2.InstanceId -Confirm:$false