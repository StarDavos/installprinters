# installprinters

Printer Install powershell script
Open powershell as an admin
Set-executionpolicy RemoteSigned

Follow the prompts
This script can auto download and install drivers for
Ricoh Printers
HP Printers
Xerox Printers
Kyocera Printers
Brother Printers
With the brother printers the script runs the exe, please follow the prompts

After the drivers download and install you just need to enter in the IP address
and the name of the printer
You can continue to install more printers
If the drivers are already installed on the machine you can skip the install
and install the printer directly and select from the menu the printer you want to add
Added functions to call back to the download section of the script so you do not have to rerun the script in order to download drivers for other printers
All drivers downloaded are the universal drivers for the printrs. Models listed can be found in the inf files for each vendor.
