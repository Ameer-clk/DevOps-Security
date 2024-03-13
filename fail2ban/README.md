# Blocking Brute Force Attacks with Fail2Ban

## Overview
Fail2Ban is a tool designed to protect servers from brute force attacks by monitoring log files and taking action against IP addresses that exhibit suspicious behavior. This README provides instructions on how to install and configure Fail2Ban on your EC2 instance to enhance the security of your SSH server.

## Installation
1. SSH into your EC2 instance.
2. Update the package list using the command:
    ```
    sudo apt-get update
    ```
3. Install Fail2Ban using the command:
    ```
    sudo apt-get install fail2ban
    ```

## Configuration
1. Create a new configuration file specifically for SSH by executing:
    ```
    sudo vim /etc/fail2ban/jail.d/sshd.conf
    ```
2. In the configuration file, you can define rules and settings specific to SSH protection. Refer to Fail2Ban documentation for configuration options.

## SSHD Filter
1. Create the SSHD filter by copying the default filter configuration:
    ```
    sudo cp /etc/fail2ban/filter.d/sshd.conf /etc/fail2ban/filter.d/sshd.local
    ```
2. You can customize the SSHD filter settings in `sshd.local` to suit your needs.

## Restart Fail2Ban
Restart the Fail2Ban service to apply the new configuration:
   ```
 systemctl retstart fail3ban

 ```

## Viewing Logs
To view Fail2Ban logs and monitor its activity, use the following command:
 ```
 vim /var/log/auth.log

 ```

## Important Note
- Ensure that you have appropriate permissions and backups before making changes to configuration files.
- Regularly monitor Fail2Ban logs to identify and respond to potential security threats effectively.
- Consider implementing additional security measures such as key-based authentication and strong password policies for enhanced security.

## License
This document is provided under the [MIT License](LICENSE).
