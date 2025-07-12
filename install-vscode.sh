#!/bin/bash

# ------------------------------------------------------------------------------
# install-vscode.sh
# ------------------------------------------------------------------------------
# Author: Shamim Hossen
# Description: A script to install Visual Studio Code on Ubuntu using the
#              official Microsoft APT repository.
# ------------------------------------------------------------------------------
# Requirements:
# - Ubuntu/Debian-based Linux system
# - sudo privileges
# ------------------------------------------------------------------------------

# Stop on any error
set -e

echo "==================================================================="
echo "  Step 1: Update system and install required tools"
echo "==================================================================="

# Update the package list
echo "🔄 Updating package list..."
sudo apt update

# Install required packages for managing repositories and secure downloads
echo "📦 Installing required tools: software-properties-common, apt-transport-https, wget"
sudo apt install -y software-properties-common apt-transport-https wget

echo "✅ Step 1 completed."
echo ""

echo "==================================================================="
echo "  Step 2: Import Microsoft GPG key"
echo "==================================================================="

# Add Microsoft GPG key so APT trusts their packages
echo "🔐 Adding Microsoft's GPG key..."
wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -

echo "✅ Step 2 completed."
echo ""

echo "==================================================================="
echo "  Step 3: Add VSCode APT repository"
echo "==================================================================="

# Add the VSCode repository to the system sources
echo "📦 Adding Microsoft VSCode repository..."
sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"

echo "✅ Step 3 completed."
echo ""

echo "==================================================================="
echo "  Step 4: Install Visual Studio Code"
echo "==================================================================="

# Update package list again and install VSCode
echo "🔄 Updating package list again to include VSCode repo..."
sudo apt update

echo "💻 Installing Visual Studio Code..."
sudo apt install -y code

echo "✅ VSCode installation complete!"
echo "🚀 You can now launch it by typing: code"
