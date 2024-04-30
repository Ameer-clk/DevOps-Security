#!/bin/bash

# Install Fail2Ban
sudo apt-get update
sudo apt-get install -y fail2ban

# Create a new configuration file for SSH
sudo bash -c 'cat <<EOT > /etc/fail2ban/jail.d/sshd.conf
[sshd]
enabled = true
port = ssh
filter = sshd
logpath = /var/log/auth.log
maxretry = 1
findtime = 600
bantime = 3600
EOT'

# Create the http-get-dos filter
sudo bash -c 'cat <<EOT > /etc/fail2ban/filter.d/ht tp-get-dos.conf
[Definition]
failregex = ^<HOST> -.*"(GET|POST|PUT|DELETE).*/(index\.php|wp-login|\.php|\.html|\.htm|\.jsp|\.jspx|\.action|\.do|\.jspf|\.axd|\.asmx|\.aspx|\.ashx|\.acx|\.svc|\.mvc|\.soap|\.asmx|\.json|\.xml|\.gif|\.png|\.jpe?g|\.ico|\.svg|\.svgz|\.js|\.css|\.html?|\.xhtml?|\.asx|\.axd|\.cgi|\.pl|\.php[34]?|\.ida|\.idq|\.inc|\.swf|\.xmltv|\.rem|\.m3u8|\.xspf|\.strm|\.pls|\.txt|\.csv|\.rss|\.atom|\.xml|\.xsl|\.xslt|\.xlm|\.xla|\.xlc|\.xlt|\.xlw|\.xlam|\.xlm|\.xlsb|\.xlsx|\.xltx|\.xltm|\.xlsm|\.xla|\.xlam|\.xlc|\.xlt|\.xlw|\.ppt|\.pptx|\.pps|\.ppsm|\.ppsx|\.pot|\.potx|\.potm|\.ppam|\.sldm|\.sldx|\.onetoc|\.onetoc2|\.onetmp|\.one|\.odt|\.ods|\.odp|\.odg|\.odf|\.odb|\.odc|\.odm|\.odc|\.one|\.wps|\.wks|\.wcm|\.wdb|\.wps|\.doc|\.docx|\.docm|\.dot|\.dotx|\.dotm|\.dot|)$
ignoreregex =
EOT'

# Create the https-get-dos filter 
sudo bash -c 'cat <<EOT > /etc/fail2ban/filter.d/https-get-dos.conf
[Definition]
failregex = ^<HOST> -.*"(GET|POST|PUT|DELETE).*://.*(/(index\.php|wp-login|\.php|\.html|\.htm|\.jsp|\.jspx|\.action|\.do|\.jspf|\.axd|\.asmx|\.aspx|\.ashx|\.acx|\.svc|\.mvc|\.soap|\.asmx|\.json|\.xml|\.gif|\.png|\.jpe?g|\.ico|\.svg|\.svgz|\.js|\.css|\.html?|\.xhtml?|\.asx|\.axd|\.cgi|\.pl|\.php[34]?|\.ida|\.idq|\.inc|\.swf|\.xmltv|\.rem|\.m3u8|\.xspf|\.strm|\.pls|\.txt|\.csv|\.rss|\.atom|\.xml|\.xsl|\.xslt|\.xlm|\.xla|\.xlc|\.xlt|\.xlw|\.xlam|\.xlm|\.xlsb|\.xlsx|\.xltx|\.xltm|\.xlsm|\.xla|\.xlam|\.xlc|\.xlt|\.xlw|\.ppt|\.pptx|\.pps|\.ppsm|\.ppsx|\.pot|\.potx|\.potm|\.ppam|\.sldm|\.sldx|\.onetoc|\.onetoc2|\.onetmp|\.one|\.odt|\.ods|\.odp|\.odg|\.odf|\.odb|\.odc|\.odm|\.odc|\.one|\.wps|\.wks|\.wcm|\.wdb|\.wps|\.doc|\.docx|\.docm|\.dot|\.dotx|\.dotm|\.dot|)$
ignoreregex =
EOT'

# Configure the http jail
sudo bash -c 'cat <<EOT > /etc/fail2ban/jail.d/http.conf
[http]
enabled = true 
port = http
filter = http-get-dos
logpath = /var/log/auth.log 
maxretry = 100
findtime = 600
bantime = 3600
EOT'

# Configure the https jail 
sudo bash -c 'cat <<EOT > /etc/fail2ban/jail.d/https.conf
[https]
enabled = true 
port = https 
filter = https-get-dos 
logpath = /var/log/auth.log 
maxretry = 100
findtime = 600
bantime = 3600
EOT'

# Create the sshd filter
sudo cp /etc/fail2ban/filter.d/sshd.conf /etc/fail2ban/filter.d/sshd.local

# Restart Fail2Ban
sudo systemctl restart fail2ban

