# Auto Script and File Updater with PLCnext eHMI Support Files #
This application is used to deploy Linux based applications or Linux file changes to the PLCnext Controller via eHMI support files.
## 1. Installation
1. Download all files onto your PC, then connect to the PLCnext via WinSCP or your favorite SSH client.
2. Copy all files to the `````/opt/plcnext/````` directory on the PLCnext.
3. Log onto the PLCnext via PuTTY or your favorite SSH client.
4. Log in as the root user.
5. Run the below commands:
```
chmod +x install.sh
./install.sh
```

Once the script returns "Install Complete", the auto-updater code is installed and running.

## Application Notes:
This application is looking for file ```update.tar``` within the eHMI support file location. 
If found it extracts the tarball and runs the ```updateFiles.sh``` script. 

### updatefiles.sh
The updatefiles.sh file will be used to update all settings and move files to your specified locations. 
There are no guides on this as this must be developed yourself, built for your application.

### To create a tarball:
1. Create a folder inside the /opt/plcnext/ directory: ```mkdir /opt/plcnext/update```
2. Add all files and scripts into the folder
3. Zip the folder into a tarball using this command: ```tar -czf update.tar update```
4. Copy the tar onto your PC using SFTP
5. Add the tarball to the support folder on your PLCnext Application.

### update.tar recommended topology
#### Note: ```updateFiles.sh``` MUST exist. It updates the files within the tarball.

```
update
|-- updateFiles.sh
|-- Python Updates
|    |-- AWS.sh
|    |-- AWS.py
|    |-- functions.py
|    |-- resetUSmeter.py
|    |-- restartPy.py
|    |-- restartPyPurge.py
|-- File Updates
|    |-- udhcpd.conf
|    |-- ntp.conf
|    |-- ProficloudV3.config
|    |-- TrafficLight.config
|-- File Uploads
|    |-- ProficloudCA.crt

```