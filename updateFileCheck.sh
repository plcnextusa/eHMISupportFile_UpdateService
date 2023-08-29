#!/bin/bash

# Path definitions
BASE_PATH=/opt/plcnext/
EHMI_PATH=/opt/plcnext/projects/PCWE/Services/Ehmi/ehmi/
LOGFILE=/opt/plcnext/logs/updates.log

# Loop Counter
index=0

# Function to check for tar file and extract if exists
function fileExists(idx) {
  # Check for update file
  if [ -f ${EHMI_PATH}update.tar ]; then
    # Extract update file
    tar -xf ${EHMI_PATH}update.tar -C /opt/plcnext/
    # Check for script to execute update
    if [ -f ${BASE_PATH}update/updateFiles.sh ]; then
      echo "$(date +%F_%T) - Update tar found. Installing file updates.\n" >> LOGFILE
      return 0
    else
      echo "$(date +%F_%T) - Update tar found but no update script attached.\n" >> LOGFILE
      return 1
    fi
  else
    # Update file does not exist.
    return 1
  fi
}

function


# Loop to run forever
while [ 1 ]
do
  # Only run script if file exists and extract is successful.
  if fileExists(index); then
    sh ${BASE_PATH}update/updateFiles.sh
    rm -r ${EHMI_PATH}update.tar
  fi
  # Sleep to reduce load
  sleep 60
done