# Registry paths to check and add values
$regKeyPaths = @(
    "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Setup\MoSetup",
    "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Setup\LabConfig",
    "HKLM:\SYSTEM\Setup"  # Added HKLM\SYSTEM\Setup path
)

# Values to add for bypassing system requirements
$values = @{
    "AllowUpgradesWithUnsupportedTPMOrCPU" = 1
    "AllowUpgradesWithUnsupportedRAM" = 1
    "AllowUpgradesWithUnsupportedDisk" = 1
    "AllowUpgradesWithUnsupportedSecureBoot" = 1
    "AllowUpgradesWithUnsupportedCPU" = 1   # Added unsupported CPU bypass
}

# Apply registry settings
foreach ($keyPath in $regKeyPaths) {
    # Check if the registry path exists, if not, create it
    if (-not (Test-Path $keyPath)) {
        Write-Host "Creating registry key: $keyPath"
        New-Item -Path $keyPath -Force
    }

    # Apply each registry value
    foreach ($valueName in $values.Keys) {
        Write-Host "Setting registry value: $valueName"
        Set-ItemProperty -Path $keyPath -Name $valueName -Value $values[$valueName] -Force
    }
}

Write-Host "Registry changes applied successfully!"
