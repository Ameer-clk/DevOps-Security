import requests
from bs4 import BeautifulSoup
import re
import urllib.parse

def is_url_valid(url):
    parsed = urllib.parse.urlparse(url)
    return bool(parsed.netloc) and bool(parsed.scheme)

def get_links(url):
    response = requests.get(url)
    soup = BeautifulSoup(response.text, 'html.parser')
    links = []
    for a_tag in soup.find_all('a'):
        href = a_tag.attrs.get('href')
        if href == "" or href is None:
            continue
        href = urllib.parse.urljoin(a_tag.base, href)
        if not is_url_valid(href):
            continue
        links.append(href)
    return links

def scan_for_injection_vulnerabilities(url, payloads):
    for payload in payloads:
        injection_url = f"{url}?id={payload}"
        response = requests.get(injection_url)
        if payload in response.text:
            print(f"Potential SQL Injection vulnerability found at {injection_url}")

def scan_for_xss_vulnerabilities(url, payloads):
    for payload in payloads:
        injection_url = f"{url}?id={payload}"
        response = requests.get(injection_url)
        if payload in response.text:
            print(f"Potential XSS vulnerability found at {injection_url}")

def main():
    url = "https://cloudstudy0.godaddysites.com"
    if not is_url_valid(url):
        print("Invalid URL. Exiting...")
        return

    payloads = [
        "' OR 1=1 --",
        "' OR 1=1 #",
        "' AND 1=1 --",
        "' AND 1=1 #"
    ]

    xss_payloads = [
        "<script>alert('XSS')</script>",
        "<img src=x onerror=alert('XSS')>",
        "<svg onload=alert('XSS')>"
    ]

    links = get_links(url)
    print(f"Found {len(links)} links:")
    for link in links:
        print(link)

    print("\nStarting vulnerability scan...")
    scan_for_injection_vulnerabilities(url, payloads)
    scan_for_xss_vulnerabilities(url, xss_payloads)

if __name__ == "__main__":
    main()