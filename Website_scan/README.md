# Web Vulnerability Scanner

## Overview
This Python script is a simple web vulnerability scanner that detects potential SQL injection and cross-site scripting (XSS) vulnerabilities in web pages.

## Features
- Scrapes links from a given webpage.
- Tests for SQL injection vulnerabilities by injecting payloads into query parameters.
- Tests for XSS vulnerabilities by injecting payloads into query parameters.
- Prints potential vulnerabilities found during the scan.

## Usage
1. Ensure you have Python installed on your system.
2. Install the required dependencies by running:
    ```
    pip install requests beautifulsoup4
    ```
3. Run the script by executing the following command:
    ```
    python web_vulnerability_scanner.py
    ```
4. Provide the URL of the webpage you want to scan when prompted.

## Important Note
- This script is intended for educational purposes and should only be used with permission to test websites you own or have explicit authorization to test.
- Unauthorized scanning of websites may violate laws and ethical guidelines.

## Contributing
If you find any issues or have suggestions for improvements, please feel free to submit a pull request or open an issue on GitHub.

## License
This project is licensed under the [MIT License](LICENSE).
