import requests
import json

def get_azure_metadata(key=None):
    metadata_url = "http://169.254.169.254/metadata/instance?api-version=2021-02-01"
    
    headers = {
        "Metadata": "true"
    }

    try:
        response = requests.get(metadata_url, headers=headers)
        if response.status_code == 200:
            azure_metadata = response.json()
            if key:
                return azure_metadata.get(key)
            else:
                return azure_metadata
        else:
            print(f"Failed to fetch metadata. Status Code: {response.status_code}")
            return None
    except requests.exceptions.RequestException as e:
        print(f"Error fetching metadata: {e}")
        return None

def main():
    data_key = 'compute'
    metadata_value = get_azure_metadata(data_key)
    if metadata_value:
        json_output = json.dumps(metadata_value, indent=4)
        print(json_output)
    else:
        print(f"Failed to retrieve '{data_key}' from Azure metadata.")

if __name__ == "__main__":
    main()
