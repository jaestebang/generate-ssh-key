#!/bin/bash

# Required parameters:
# - email: The email associated with the SSH key.
# - domain: The domain used in the SSH config.

# @raycast.schemaVersion 1
# @raycast.title Generate SSH Key
# @raycast.mode fullOutput

# Optional parameters:
# @raycast.icon 🤖

# Documentation:
# - This script generates an SSH key, updates the SSH config with the provided domain,
#   and adds the private key to the SSH agent.
# - It prompts the user for their email and domain.
# - The generated SSH key will be saved as ~/.ssh/id_rsa_<email_sanitized>.
# - The SSH config will have an entry for the provided domain.
# - The public key will be displayed and can be copied.

# Documentation:
# @raycast.author jaestebang
# @raycast.authorURL https://raycast.com/jaestebang

# Prompt for email
read -p "Enter your email: " email

# Prompt for domain
read -p "Enter your domain (eg: https://github.com): " domain

if [ -z "$email" ] || [ -z "$domain" ]; then
  echo "Error: Email and domain are required."
  exit 1
fi

# Create a sanitized version of the email to use in the filename
email_sanitized=$(echo "$email" | tr -cs '[:alnum:]' '_')

keyfile=~/.ssh/id_rsa_${email_sanitized}

# Generate SSH key
ssh-keygen -t rsa -b 4096 -C "$email" -f "$keyfile"

# Create or update SSH config
echo -e "Host $domain\n  HostName $domain\n  User git\n  IdentityFile $keyfile" >> ~/.ssh/config

# Add the private key to SSH agent
ssh-add "$keyfile"

echo "SSH setup for $email and $domain completed:"

# Display and copy the public key
cat "$keyfile.pub"
