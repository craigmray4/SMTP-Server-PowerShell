$IsInstalled = Get-WindowsFeature SMTP-Server
If ($IsInstalled.InstallState -eq 'Installed')
  {
  Write-Host "SMTP-Server is already installed."
  }
Else
  {
  Add-WindowsFeature SMTP-Server
  Set-Service SMTPSVC -startuptype "Automatic"
  Get-WmiObject -Class Win32_Service -Property StartMode -Filter "Name='SMTPSVC'"
  }
