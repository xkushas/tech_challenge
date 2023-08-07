import json

def get_value_by_key(nested_object, keys):
    result = nested_object
    try:
        for key in keys:
            result = result[key]
        return result
    except (KeyError, TypeError):
        return None

def get_nested_object_from_user():
    try:
        input_json = input("Enter the nested object in JSON format: ")
        nested_object = json.loads(input_json)
        return nested_object
    except json.JSONDecodeError:
        print("Invalid JSON input. Please enter a valid JSON object.")
        return None

def get_keys_from_user():
    try:
        input_keys = input("Enter keys separated by '/': ")
        keys_list = input_keys.split('/')
        return keys_list
    except KeyboardInterrupt:
        print("\nKeyboardInterrupt: You canceled the input.")
        return None

def main():
    nested_object = get_nested_object_from_user()
    if nested_object:
        print("You entered the following nested object:")
        print(json.dumps(nested_object, indent=4))

        keys = get_keys_from_user()
        if keys:
            value = get_value_by_key(nested_object, keys)
            print(f"The value at key '{'/'.join(keys)}' is: {value}")

if __name__ == "__main__":
    main()