#!/bin/bash

echo"WElcome to hacking"

# Prompt user for target URL
echo "Enter the target URL:"
read url

# Prompt user for output file name
echo "Enter the output file name:"
read output_file

# Perform subdomain enumeration
echo "Performing subdomain enumeration..."
subdomains=$(subfinder -d "$url")
echo "$subdomains" >> "$output_file"

# Perform directory and file discovery
echo "Performing directory and file discovery..."
dirsearch -u "$url" -e * >> "$output_file"

# Check for open ports and running services
echo "Performing port scan..."
nmap -sC -sV "$url" >> "$output_file"

# Check for known vulnerabilities
echo "Checking for known vulnerabilities..."
vulners -s "$url" >> "$output_file"

echo "Recon complete!"
