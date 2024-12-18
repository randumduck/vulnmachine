Here's the updated `README.md` file for your GitHub repository:

```markdown
# Vulnerable Machine Setup Script

This repository contains a bash script to set up a vulnerable Ubuntu virtual machine for penetration testing and security training. The script installs and configures various applications with known vulnerabilities, allowing you to practice exploiting them using tools like Burp Suite.

## Prerequisites

- Ubuntu VM (preferably a fresh installation)
- Internet connection
- Sufficient disk space and memory

## Installation

1. **Clone the repository**:
   ```bash
   git clone https://github.com/randumduck/vulnmachine.git
   cd vulnmachine
   ```

2. **Make the script executable**:
   ```bash
   chmod +x setup_vulnerable_machine.sh
   ```

3. **Run the script**:
   ```bash
   sudo ./setup_vulnerable_machine.sh
   ```

## What the Script Does

1. **System Update and Upgrade**:
   - Updates and upgrades the system packages.

2. **Installs Vulnerable Applications**:
   - OpenSSH
   - Apache web server
   - PHP
   - MySQL
   - vsftpd (FTP server)
   - Samba
   - phpMyAdmin
   - WordPress
   - Drupal

3. **Configures a Vulnerable Web Application**:
   - Sets up a basic vulnerable PHP application and configures Apache to serve it.

4. **Creates Vulnerable MySQL Database and User**:
   - Creates a MySQL database and user with weak credentials.

5. **Sets Up a Vulnerable Samba Share**:
   - Configures a Samba share with open permissions.

6. **Installs DVWA (Damn Vulnerable Web Application)**:
   - Installs and configures DVWA for security testing.

7. **Restarts Services**:
   - Restarts Apache and Samba services to apply the changes.

8. **Installs Additional Tools**:
   - Installs `netcat` and `nmap` for network testing.

## Usage

After running the script, your VM will have several vulnerable applications and services. You can use tools like Burp Suite, nmap, and others to practice finding and exploiting vulnerabilities.

## Disclaimer

This script is intended for educational purposes only. Use it in a controlled and isolated environment. Do not use it on production systems or networks without proper authorization.

## Contributing

If you have suggestions or improvements, feel free to open an issue or submit a pull request.

## License

This project is licensed under the MIT License. See the LICENSE file for details.
