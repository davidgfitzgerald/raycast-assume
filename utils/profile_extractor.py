#!/usr/bin/env python3
"""
Extract all of the profile names from ~/.aws/config

This outputs them to a file called profiles.json in the format:

[{"title": "profile1", "value": "profile1"}, {"title": "profile2", "value": "profile2"}...]

This can then be copied into the raycast assume.sh script as a dropdown argument.
"""
import json
import configparser
from pathlib import Path


def extract_aws_profiles():
    """Extract AWS profile names from ~/.aws/config and create JSON output"""
    
    # Get the path to the AWS config file
    config_path = Path.home() / '.aws' / 'config'
    
    # Check if the config file exists
    if not config_path.exists():
        print(f"AWS config file not found at {config_path}")
        return []
    
    # Parse the config file
    config = configparser.ConfigParser()
    
    try:
        config.read(config_path)
    except Exception as e:
        print(f"Error reading config file: {e}")
        return []
    
    profiles = []
    
    # Iterate through all sections in the config file
    for section_name in config.sections():
        # AWS profiles are stored as [profile profile_name] except for [default]
        if section_name == 'default':
            profile_name = 'default'
        elif section_name.startswith('profile '):
            profile_name = section_name[8:]  # Remove 'profile ' prefix
        else:
            # Skip non-profile sections
            continue
        
        # Create the profile object with title and value matching the profile name
        profile_obj = {
            "title": profile_name,
            "value": profile_name
        }
        profiles.append(profile_obj)
    
    return profiles


def save_profiles_json(profiles):
    """Save the profiles list to profiles.json as a compressed JSON string"""
    try:
        with open('profiles.json', 'w') as f:
            json.dump(profiles, f, separators=(',', ':'))
        print(f"Successfully saved {len(profiles)} profiles to profiles.json")
    except Exception as e:
        print(f"Error saving profiles.json: {e}")


def main():
    print("Extracting AWS profiles from ~/.aws/config...")
    
    # Extract profiles
    profiles = extract_aws_profiles()
    
    if not profiles:
        print("No profiles found or error occurred")
        return
    
    # Display found profiles
    print(f"Found {len(profiles)} profiles:")
    for profile in profiles:
        print(f"  - {profile['title']}")
    
    # Save to JSON file
    save_profiles_json(profiles)


if __name__ == "__main__":
    main()