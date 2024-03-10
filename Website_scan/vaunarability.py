import urllib.parse
import requests

def is_local_url(url):
    parsed_url = urllib.parse.urlparse(url)
    return parsed_url.scheme == "file"

def is_within_app_directory(url, app_directory):
    parsed_url = urllib.parse.urlparse(url)
    return parsed_url.path.startswith(app_directory)

def check_url_vulnerability(url, app_directory):
    try:
        response = requests.get(url)
        if response.status_code == 200:
            if is_local_url(url):
                print(f"Warning: The URL '{url}' is local to the host.")
            elif is_within_app_directory(url, app_directory):
                print(f"Warning: The URL '{url}' is within the application's directory structure.")
            else:
                print(f"The URL '{url}' seems to be valid and accessible.")
        else:
            print(f"Warning: The URL '{url}' is not accessible.")
    except requests.exceptions.RequestException as e:
        print(f"Error: {e}")

# Example usage
url = "http://www.microsoft.com/en/us/default.aspx?redir=true"
app_directory = "/en/us"
check_url_vulnerability(url, app_directory)
