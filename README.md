Web Security Toolkit
Welcome to the Web Security Toolkit repository! This toolkit includes a collection of Python scripts and configuration files aimed at enhancing the security of web applications and servers. Whether you're a developer, system administrator, or security enthusiast, this toolkit offers valuable tools and guidelines for identifying and mitigating common web security vulnerabilities.

Features
Web Vulnerability Scanner: A Python script that scans web pages for potential SQL injection and cross-site scripting (XSS) vulnerabilities.
Fail2Ban Configuration: Instructions for installing and configuring Fail2Ban on your server to protect against brute force attacks.
Simple Port Scanner: Another Python script for scanning open TCP ports on target hosts to identify potential security risks.
Table of Contents
Installation
Usage
Important Notes
Contributing
License
Installation
Prerequisites
Python 3.x
pip package manager
Installation Steps
Clone this repository to your local machine:

bash
Copy code
git clone https://github.com/your-username/web-security-toolkit.git
Navigate to the project directory:

bash
Copy code
cd web-security-toolkit
Install the required dependencies using pip:

Copy code
pip install -r requirements.txt
Usage
Each tool or configuration provided in this toolkit comes with detailed usage instructions and guidelines. Refer to the respective sections below for more information.

Web Vulnerability Scanner
Ensure you have Python installed on your system.
Install the required dependencies by running:
Copy code
pip install requests beautifulsoup4
Run the script by executing the following command:
Copy code
python web_vulnerability_scanner.py
Provide the URL of the webpage you want to scan when prompted.
Fail2Ban Configuration
SSH into your EC2 instance.
Update the package list using the command:
sql
Copy code
sudo apt-get update
Install Fail2Ban using the command:
arduino
Copy code
sudo apt-get install fail2ban
Configure Fail2Ban by creating a new configuration file:
bash
Copy code
sudo vim /etc/fail2ban/jail.d/sshd.conf
Add your desired rules and settings for SSH protection.
Create the SSHD filter by copying the default filter configuration:
bash
Copy code
sudo cp /etc/fail2ban/filter.d/sshd.conf /etc/fail2ban/filter.d/sshd.local
Restart the Fail2Ban service to apply the new configuration:
Copy code
sudo systemctl restart fail2ban
Simple Port Scanner
Ensure you have Python installed on your system.
Run the script by executing the following command:
Copy code
python simple_port_scanner.py
Provide the IP address or hostname of the target host when prompted.
Important Notes
Educational Purposes: All tools and configurations included in this toolkit are intended for educational purposes only. Always use them responsibly and with proper authorization.
License: This project is licensed under the MIT License. See the LICENSE file for details.
Contributing
Your contributions are welcome! If you find any issues, have suggestions for improvements, or want to add new features, please feel free to submit a pull request or open an issue on GitHub.

