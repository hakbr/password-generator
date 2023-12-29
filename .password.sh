#!/bin/bash

# Function to generate a random password with alphanumeric characters (upper and lower case)
generate_password() {
    local length=$1
    local password=""

    for ((i = 0; i < length; i++)); do
        # Generate a random character from a-z or A-Z or 0-9
        char=$(LC_CTYPE=C tr -dc 'a-zA-Z0-9' < /dev/urandom | head -c 1)
        password="${password}${char}"
    done

    echo "$password"
}

# Prompt the user to enter the desired password length
read -p "Enter the password length: " password_length

# Validate input (ensure it's a positive integer)
if [[ ! "$password_length" =~ ^[1-9][0-9]*$ ]]; then
    echo "Please enter a valid positive integer for the password length."
    exit 1
fi

# Generate and display the password
echo "Generated Password: $(generate_password $password_length)"
