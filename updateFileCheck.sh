#!/bin/bash

# Path definitions
BASE_PATH=/opt/plcnext/
EHMI_PATH=/opt/plcnext/projects/PCWE/Services/Ehmi/ehmi/


# Function to check for tar file and extract if exists
function fileExists() {
  # Check for update file
  if [ -f ${EHMI_PATH}update.tar ]; then
    # Extract update file
    tar -xf ${EHMI_PATH}update.tar -C /opt/plcnext/
    # Check for script to execute update
    if [ -f ${BASE_PATH}update/updateFiles.sh ]; then
      echo "Update tar found. Installing file updates."
      return 0
    else
      echo "Update tar found but no update script attached."
      return 1
    fi
  else
    # Update file does not exist.
    echo "Update does not exist"
    return 1
  fi
}



# Loop to run forever
while [ 1 ]
do
  # Only run script if file exists and extract is successful.
  if fileExists; then
    sh ${BASE_PATH}update/updateFiles.sh
    rm -r ${EHMI_PATH}update.tar
  fi
  # Sleep to reduce load
  sleep 60
done