#!/bin/bash

# Check if pivpn is installed
if ! command -v pivpn &> /dev/null; then
    echo "PiVPN is not installed. Exiting."
    exit 1
fi

echo "==========================="
echo "  PiVPN Client Manager"
echo "==========================="

# Ask for client name
read -p "Enter a name for the new VPN client: " CLIENT_NAME

# Validate input
if [ -z "$CLIENT_NAME" ]; then
    echo "Client name cannot be empty. Exiting."
    exit 1
fi

# Add new VPN client using pivpn
echo "Creating VPN client: $CLIENT_NAME"
pivpn add -n "$CLIENT_NAME"

# Find WireGuard config location
WG_CONF="/home/ubuntu/configs/${CLIENT_NAME}.conf"

# Check if config file exists
if [ -f "$WG_CONF" ]; then
    echo "Client config generated at: $WG_CONF"
    echo "To transfer config to your device, run:"
    echo "scp ubuntu@your-server-ip:$WG_CONF ."
else
    echo "Client config file not found in expected location."
fi

echo "Done."

# Update AllowedIPs in the configuration file

echo "Updating AllowedIPs in $WG_CONF..."

# sed is a command in BASH that finds text in a file and replaces it
sed -i 's/AllowedIPs = 0.0.0.0\/0, ::\/0/AllowedIPs = 10.0.0.0\/24/' "$WG_CONF"

# Verify change
if grep -q "AllowedIPs = 10.0.0.0/24" "$WG_CONF"; then
    echo "Successfully updated AllowedIPs to 10.0.0.0/24."
else
    echo "Failed to update AllowedIPs. Please check the config file manually."
fi

# Install and configure UFW
echo "Installing and configuring firewall"
sudo apt install ufw
sudo ufw allow 51820/udp
sudo ufw allow 80/tcp
sudo ufw allow 443/tcp
