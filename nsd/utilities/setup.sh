#!/bin/bash

# (c) 2024 HomeAPIs.com. All rights reserved.

# The latest version of this install script is accessible via https://setup.homeapis.com/
# DO NOT USE IF NOT A MEMBER OF HOMEAPIS.COM, INC.
# USE OUTSIDE OF THE HOMEAPIS NETWORK OF COMPUTERS IS PROHIBITED
# AND MAY CAUSE UNEXPECTED BUGS AND ERRORS WHEN RUN OUTSIDE OF HAC

# Function to display network interfaces in a table
function display_interfaces() {
  netstat -i | awk '{print $1, $4}' | column -t -s $'\t'
}

# Prompt user for confirmation
printf "Do you still want to run Network Service Discovery (NSD) on this computer? (y/N): "

# Read user input
read -r user_choice

# Convert user input to lowercase for easier comparison
user_choice=$(tr [A-Z] [a-z] <<< "$user_choice")

# Display network interfaces and confirm again if user confirms initially
if [[ "$user_choice" == "y" ]]; then
  # Display network interfaces
  display_interfaces

  # Ask for confirmation again after displaying interfaces
  printf "\nThe above are your network interfaces. Are you sure you want to continue? (y/N): "
  read -r user_choice
  user_choice=$(tr [A-Z] [a-z] <<< "$user_choice")
fi

# Perform actions based on final confirmation
if [[ "$user_choice" == "y" ]]; then
  # Sample NSD logic (replace with your actual implementation)
  echo "Running Network Service Discovery..."
  # Simulate scanning for services on local network
  sleep 2  # Simulate some work
  # List some sample services (replace with actual discovered services)
  echo "Found services:"
  echo "  - Web server (port 80)"
  echo "  - SSH server (port 22)"
  # ... (your NSD logic for processing discovered services) ...
else
  echo "Network Service Discovery cancelled."
fi
