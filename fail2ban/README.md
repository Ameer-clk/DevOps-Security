Blocking the Brute Force Attack using Fail2 Ban:

SSH into your EC2 instance and install Fail2Ban: 

sudo apt-get update
sudo apt-get install fail2ban


Create a new configuration file for SSH:

sudo vim  /etc/fail2ban/jail.d/sshd.conf

Add the following content to the file:

[sshd]
enabled = true
port = ssh
filter = sshd
logpath = /var/log/auth.log
maxretry = 10
findtime = 600
bantime = 3600


Create the sshd filter by copying the default filter:

sudo cp /etc/fail2ban/filter.d/sshd.conf /etc/fail2ban/filter.d/sshd.local

Restart Fail2Ban:

sudo systemctl restart fail2ban

To view the Fail2Ban logs, you can use the following command:

sudo journalctl -u fail2ban.service


# Github Ip address fro nOt Blocking
[sshd]
enabled = true
port = ssh
filter = sshd
logpath = /var/log/auth.log
maxretry = 10
findtime = 600
bantime = 3600

# Exclude specific IP address ranges from being blocked
[Definition]
failregex = ^%(__prefix_line)s(?:error: PAM: )?Authentication failure for .* from <HOST>( via \S+)?\s*$
ignoreregex = 192\.168\.1\.\d+|10\.0\.0\.\d+  # Example: Exclude IP ranges 192.168.1.x and 10.0.0.x

