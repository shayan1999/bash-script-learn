#!/bin/bash

# Define your Git configurations
CONFIG_1_NAME="Personal"
CONFIG_1_USER="your_personal_username"
CONFIG_1_EMAIL="your_personal_email@example.com"

CONFIG_2_NAME="Work"
CONFIG_2_USER="your_work_username"
CONFIG_2_EMAIL="your_work_email@example.com"

# Function to set Git configuration
set_git_config() {
    git config --global user.name "$1"
    git config --global user.email "$2"
    echo "Switched to $1 Git configuration."
}

# Prompt user to choose a configuration
echo "Select Git configuration:"
echo "1. $CONFIG_1_NAME"
echo "2. $CONFIG_2_NAME"
read -p "Enter the number of the configuration: " choice

case $choice in
    1)
        set_git_config "$CONFIG_1_NAME" "$CONFIG_1_EMAIL"
        ;;
    2)
        set_git_config "$CONFIG_2_NAME" "$CONFIG_2_EMAIL"
        ;;
    *)
        echo "Invalid choice."
        ;;
esac