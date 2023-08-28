#!/bin/bash

# Start message
echo "Starting install process for automatic updates.... Please wait..."

# Changing directory to /opt/plcnext/ to prevent files being put in wrong directory.
cd /opt/plcnext/

# Check for all necessary files
if [ -f updateFileCheck.sh ] && [ -f updater.sh ]; then

  echo "Changing permissions for execution.."
  chmod +x updateFileCheck.sh
  chmod +x updater.sh

  echo "Setting up init.d"
  cp -a /opt/plcnext/updater.sh /etc/init.d/
  cd /etc/init.d/
  update-rc.d updater.sh defaults
  ./updater.sh start
  rm -r /opt/plcnext/updater.sh

  echo "Removing residual files"
  if [ -f README.md ]; then rm -r README.md; fi
  rm -r /opt/plcnext/install.sh

  echo "Install complete!"

else

  # Error message
  echo "NOT ALL INSTALLATION FILES EXIST! INSTALL ABORTED."
  echo "************************************************************************************************"
  echo "*   Files expecting: 'updateFileCheck.sh' and 'updater.sh' in the '/opt/plcnext/' directory.   *"
  echo "************************************************************************************************"

fi