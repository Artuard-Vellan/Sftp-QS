▌ SftpQS — SSH FTP Quick Setup

A simple automation script for quickly setting up an SFTP server on Microsoft Windows 11.

⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯

▌ 📚 Description

This script automates the process of configuring an SFTP server on Windows 11, ensuring all necessary components are installed and properly set up.

⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯

▌ ⚙️ Installation & Usage

1. Download the script onto your local machine running Windows 11.

2. Run the script using PowerShell with administrative privileges (Run as Administrator).

⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯

▌ ✨ Features

- Automatically installs or checks for the presence of the OpenSSH.Server package.
- Starts the sshd service if it's not already running.
- Enables automatic startup for the sshd service.
- Configures firewall rules to allow SFTP connections.
- Creates a dedicated user account specifically for accessing the SFTP server.

⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯

▌ 🛠️ Workflow (Step-by-step)

▌ Step 1. Checking and Installing the OpenSSH Server Package

The script first verifies that the OpenSSH.Server package is present in the system. If missing, it will be automatically installed.

▌ Step 2. Verifying and Starting the SSHD Service

Next, the script ensures that the sshd service is running. If stopped, it starts the service.

▌ Step 3. Setting Up Automatic Startup for SSHD

If automatic startup hasn't been enabled yet, this step enables it so that the service runs after each reboot.

▌ Step 4. Firewall Configuration

The script adds necessary firewall rules to ensure uninterrupted communication over SFTP ports.

▌ Step 5. Creating a Dedicated User Account

Finally, the script creates a new user account intended solely for secure file transfer via SFTP.

⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯
▌ 👩‍💻 Author

Feel free to contribute! Any suggestions or improvements are welcome!

⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯
▌ 🔗 License

Distributed under the MIT license. See LICENSE.md for more information.

⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯
▌ 🌐 Contributing

Contributions are what make the open-source community such an amazing place to learn, inspire, and create. Any contributions you make are greatly appreciated!

1. Fork the Project
2. Create your Feature Branch (git checkout -b feature/IncredibleFeature)
3. Commit your Changes (git commit -m 'Add some IncredibleFeature')
4. Push to the Branch (git push origin feature/IncredibleFeature)
5. Open a Pull Request
