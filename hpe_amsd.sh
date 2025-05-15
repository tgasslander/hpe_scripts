#!/bin/bash
# Source: https://downloads.linux.hpe.com/SDR/project/mcp/

# Get the Ubuntu release
ubuntu_release=$(lsb_release -cs 2>/dev/null)
echo "Detected release: $ubuntu_release"

# Get the public HPE gpg keys
curl https://downloads.linux.hpe.com/SDR/hpPublicKey2048_key1.pub | gpg --dearmor | sudo tee -a /usr/share/keyrings/hpePublicKey.gpg > /dev/null
curl https://downloads.linux.hpe.com/SDR/hpePublicKey2048_key1.pub | gpg --dearmor | sudo tee -a /usr/share/keyrings/hpePublicKey.gpg > /dev/null
curl https://downloads.linux.hpe.com/SDR/hpePublicKey2048_key2.pub | gpg --dearmor | sudo tee -a /usr/share/keyrings/hpePublicKey.gpg > /dev/null

# Add HPE repo to sources
mcp_source="deb [signed-by=/usr/share/keyrings/hpePublicKey.gpg] https://downloads.linux.hpe.com/SDR/repo/mcp/ $ubuntu_release/current non-free"
echo "mcp_source: $mcp_source"

repo_file="/etc/apt/sources.list.d/hpe-mcp.list"

echo "Creating repository file at $repo_file"
{
  echo "# HPE Management Component Pack repository for Ubuntu $ubuntu_release"
  echo "$mcp_source"
} | sudo tee $repo_file

# Verify the file was created
if [ -f "$repo_file" ]; then
  echo "Repository file created successfully!"
  echo "Contents:"
  cat $repo_file
else
  echo "Failed to create repository file!"
fi

# Update and install
apt-get update
apt-get install amsd -y

