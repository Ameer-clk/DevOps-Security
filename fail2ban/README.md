Blocking the Brute Force Attack using Fail2 Ban:

SSH into your EC2 instance and install Fail2Ban: 

sudo apt-get update
sudo apt-get install fail2ban


Create a new configuration file for SSH:

sudo vim  /etc/fail2ban/jail.d/sshd.conf


Create the sshd filter by copying the default filter:

sudo cp /etc/fail2ban/filter.d/sshd.conf /etc/fail2ban/filter.d/sshd.local

Restart Fail2Ban:

sudo systemctl restart fail2ban

To view the Fail2Ban logs, you can use the following command:

sudo journalctl -u fail2ban.service


