#!/bin/bash
# Tools for gpuCI scripts

URL="https://raw.githubusercontent.com/rapidsai/gpuci-mgmt/main/tools"

function logging {
  TS=`date`
  echo "[$TS] $@"
}

function install_tool {
  logging "Installing $1 script..."
  SAVE_LOC="$HOME/bin/${1}"
  curl -s "${URL}/${1}" -o $SAVE_LOC > /dev/null
  chmod +x $SAVE_LOC
  logging "Installed $1 script..."
}

logging "Creating ~/bin dir..."
mkdir -p $HOME/bin

install_tool gpuci_retry
install_tool gpuci_logger

logging "Adding ~/bin to PATH in ~/.bashrc ..."
echo "export PATH=\"\$HOME/bin:\$PATH\"" >> $HOME/.bashrc
source $HOME/.bashrc

logging "Tools installed..."
logging "Use 'source ~/.bashrc' to use tools in current shell..."
