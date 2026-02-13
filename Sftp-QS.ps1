Write-Host " ************************************************* " -ForegroundColor White -BackgroundColor Green
Write-Host " * Windows 11 OpenSSH Server Installation Script * " -ForegroundColor White -BackgroundColor Green
Write-Host " ************************************************* " -ForegroundColor White -BackgroundColor Green

$sshServer = Get-WindowsCapability -Online | Where-Object Name -like 'OpenSSH.Server*'
 if ($sshServer.State -eq 'Installed') {
    Write-Host ">>> OpenSSH.Server is already installed." -ForegroundColor Green
 } else {
    Write-Host ">>> OpenSSH.Server is not installed." -ForegroundColor Red
    Write-Host ">>> Installing OpenSSH.Server." -ForegroundColor Gray
    Add-WindowsCapability -Online -Name OpenSSH.Server        
    Write-Host ">>> OpenSSH.Server installed successfully." -ForegroundColor Green
}

Write-Host ">>> Starting sshd service." -ForegroundColor White
if ((Get-Service sshd).Status -eq 'Running') {
    write-Host ">>> sshd service is alreadyrunning." -ForegroundColor Green
} else {
    Write-Host ">>> sshd service is not running." -ForegroundColor Red
    Write-Host ">>> Attempting to start sshd service..." -ForegroundColor White
    Start-Service sshd
    Write-Host ">>> sshd service started successfully." -ForegroundColor Green
}

Write-Host ">>> Setting sshd service to start automatically." -ForegroundColor White
Set-Service -Name sshd -StartupType 'Automatic'
Write-Host ">>> sshd service startup type set to Automatic." -ForegroundColor Green
Write-Host ">>> Checking if firewall rule 'OpenSSH-Server-In-TCP' exists." -ForegroundColor White
if (!(Get-NetFirewallRule -Name "OpenSSH-Server-In-TCP" -ErrorAction SilentlyContinue)) {    
    Write-Host ">>> Firewall Rule 'OpenSSH-Server-In-TCP' does not exist." -ForegroundColor Red
    write-Host ">>> Creating firewall rule 'OpenSSH-Server-In-TCP' to allow inbound TCP traffic on port 22." -ForegroundColor White
    New-NetFirewallRule -Name 'OpenSSH-Server-In-TCP' -DisplayName 'OpenSSH Server (sshd)' -Enabled True -Direction Inbound -Protocol TCP -Action Allow -LocalPort 22
    Write-Host ">>> Firewall rule 'OpenSSH-Server-In-TCP' has been created." -ForegroundColor Green
} else {
    Write-Host ">>> Firewall rule 'OpenSSH-Server-In-TCP' has been created and exists." -ForegroundColor Green
}

Write-Host ">>> Creating a local user account for SFTP access." -ForegroundColor White
$username=Read-Host "Enter a username for the SFTP client account (default: sftp-client)" -ForegroundColor White
if ([string]::IsNullOrEmpty($username)) {
    $username = "sftp-client"
}
$password=Read-Host "Enter a password for the SFTP client account (default: 12345678)" -AsSecureString -Foregroundcolor White
if ($password.Length -eq 0) {
    $password = ConvertTo-SecureString "12345678" -AsPlainText -Force
}
New-LocalUser -Name $username -Password $password
Write-Host ">>> Local user account '$username' has been created with the specified password." -ForegroundColor Green
write-Host ">>> SFTP server setup is complete. You can now connect to this machine using an SFTP client with the username '$username'." -ForegroundColor Green


#Stop-Service sshd
#Remove-NetFirewallRule -Name 'OpenSSH-Server-In-TCP'
#Remove-WindowsCapability -Online -Name OpenSSH.Server~~~~0.0.1.0
#Set-Service -Name sshd -StartupType 'Manual'