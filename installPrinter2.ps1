$Ricoh="PCL6 V4 Driver for Universal Print"
$HP="HP Universal Printing PCL 6"
$Xerox="Xerox Global Print Driver PS"
$Kyocera="KX DRIVER for Universal Printing"
$Brother="Brother Mono Universal Printer (PCL)"
$download = Read-Host -Prompt "Do you need to download drivers (y/n): "

function downloaddrivers {
		mkdir c:\temp
		Write-Output "Which diver do you want to download?`n1: Ricoh Universal`n2: HP Universal`n3: Xerox Universal`n4: Kyocera Universal`n5: Brother Universal`n6: All"
		$driverdownload = Read-Host -Prompt "Choice: "
		if ($driverdownload -eq 1) {
			Invoke-WebRequest -Uri 'https://support.ricoh.com/bb/pub_e/dr_ut_e/0001335/0001335978/V42200/r98801L1a.exe' -OutFile 'c:\temp\ricoh.zip'
			Expand-Archive 'c:\temp\ricoh.zip' 'c:\temp\r98801L1a'
			PNPUtil.exe /add-driver "C:\temp\r98801L1a\disk1\r4600.inf" /install
			Add-PrinterDriver -Name "PCL6 V4 Driver for Universal Print" -InfPath "C:\Windows\System32\DriverStore\FileRepository\r4600.inf_amd64_ba364d3acadec9d8\r4600.inf"
			$msg = Read-Host -Prompt "Would you like to add a Ricoh printer today(Y/N): "
			if ($msg -eq 'y') {
				do {
					$ip= Read-Host -Prompt "IP: "
					$name= Read-Host -Prompt "Printer Name: " 
					add-printerport -name $ip -printerhostaddress $ip 
					add-printer -name $name -drivername $Ricoh -port $ip
					$msg = Read-Host -Prompt "Would you like to add another Ricoh printer today(Y/N): "
					if ($msg -eq 'n'){
						$another = Read-Host -Prompt "Do you want to download drivers for another printer (Y/N): "
						if ($another -eq 'y'){
							&downloaddrivers
						}
						elseif ($msg -eq 'n') {
							break
						}
					}
				}
				while ($msg -eq 'y')
			}
		}
		
		elseif ($driverdownload -eq 2) {
			Invoke-WebRequest -Uri 'https://ftp.hp.com/pub/softlib/software13/printers/UPD/upd-pcl6-x64-7.1.0.25570.exe' -OutFile 'c:\temp\hp.zip'
			Expand-Archive 'c:\temp\hp.zip' 'c:\temp\HP'
			PNPUtil.exe /add-driver "C:\temp\HP\hpcu270u.inf" /install
			Add-PrinterDriver -Name "HP Universal Printing PCL 6" -InfPath "C:\Windows\System32\DriverStore\FileRepository\hpcu270u.inf_amd64_3e20dbae029ad04a\hpcu270u.inf"
			$msg = Read-Host -Prompt "Would you like to add a HP printer today(Y/N): "
			if ($msg -eq 'y') {
				do {
					$ip= Read-Host -Prompt "IP: "
					$name= Read-Host -Prompt "Printer Name: " 
					add-printerport -name $ip -printerhostaddress $ip 
					add-printer -name $name -drivername $HP -port $ip
					$msg = Read-Host -Prompt "Would you like to add another HP printer today(Y/N): "
					if ($msg -eq 'n'){
						$another = Read-Host -Prompt "Do you want to download drivers for another printer (Y/N): "
						if ($another -eq 'y'){
							&downloaddrivers
						}
						elseif ($msg -eq 'n') {
							break
						}
					}
				}
				while ($msg -eq 'y')
			}
		}
		elseif ($driverdownload -eq 3) {
			Invoke-WebRequest -Uri 'https://download.support.xerox.com/pub/drivers/VLC8000W/drivers/win10x64/ar/UNIV_5.951.9.0_PS_x64.zip' -OutFile 'c:\temp\xerox.zip'
			Expand-Archive 'c:\temp\xerox.zip' 'c:\temp\Xerox'
			PNPUtil.exe /add-driver "C:\Temp\Xerox\UNIV_5.951.9.0_PS_x64_Driver.inf\x3UNIVP.inf" /install
			Add-PrinterDriver -Name "Xerox Global Print Driver PS" -InfPath "C:\Windows\System32\DriverStore\FileRepository\x3univp.inf_amd64_bfd06de331e547a5\x3UNIVP.inf"
			$msg = Read-Host -Prompt "Would you like to add a Xerox printer today(Y/N): "
			if ($msg -eq 'y') {
				do {
					$ip= Read-Host -Prompt "IP: "
					$name= Read-Host -Prompt "Printer Name: " 
					add-printerport -name $ip -printerhostaddress $ip 
					add-printer -name $name -drivername $Xerox -port $ip
					$msg = Read-Host -Prompt "Would you like to add another Xerox printer today(Y/N): "
					if ($msg -eq 'n'){
						$another = Read-Host -Prompt "Do you want to download drivers for another printer (Y/N): "
						if ($another -eq 'y'){
							&downloaddrivers
						}
						elseif ($msg -eq 'n') {
							break
						}
					}
				}
				while ($msg -eq 'y')
			}
		}
		
		elseif ($driverdownload -eq 4) {
			Invoke-WebRequest -Uri 'https://www.kyoceradocumentsolutions.us/content/download-center-americas/us/drivers/drivers/KX841716_zip.download.zip' -OutFile 'c:\temp\kyocera.zip'
			Expand-Archive 'c:\temp\kyocera.zip' 'c:\temp\Kyocera'
			PNPUtil.exe /add-driver "C:\Temp\Kyocera\64bit\OEMSETUP.inf" /install
			Add-PrinterDriver -Name "KX DRIVER for Universal Printing" -InfPath "C:\Windows\System32\DriverStore\FileRepository\oemsetup.inf_amd64_9359bc628c627b7a\OEMSETUP.inf"
			$msg = Read-Host -Prompt "Would you like to add a Kyocera printer today(Y/N): "
			if ($msg -eq 'y') {
				do {
					$ip= Read-Host -Prompt "IP: "
					$name= Read-Host -Prompt "Printer Name: " 
					add-printerport -name $ip -printerhostaddress $ip 
					add-printer -name $name -drivername $Kyocera -port $ip
					$msg = Read-Host -Prompt "Would you like to add another Kyocera printer today(Y/N): "
					if ($msg -eq 'n'){
						$another = Read-Host -Prompt "Do you want to download drivers for another printer (Y/N): "
						if ($another -eq 'y'){
							&downloaddrivers
						}
						elseif ($msg -eq 'n') {
							break
						}
					}
				}
				while ($msg -eq 'y')
			}
		}
		
		elseif ($driverdownload -eq 5) {
			Invoke-WebRequest -Uri 'https://download.brother.com/welcome/dlf004694/UNIV-PCL-0111.EXE' -OutFile c:\temp\brother.exe
			Start-Process 'c:\temp\brother.exe'
			PNPUtil.exe /add-driver "C:\Windows\System32\DriverStore\FileRepository\brupcb0a.inf_amd64_5d1c58716e6374b3\brupcb0a.inf" /install
			Add-PrinterDriver -Name "Brother Mono Universal Printer (PCL)" -InfPath "C:\Windows\System32\DriverStore\FileRepository\brupcb0a.inf_amd64_5d1c58716e6374b3\brupcb0a.inf"
			$msg = Read-Host -Prompt "Would you like to add a Brother printer today(Y/N): "
			if ($msg -eq 'y') {
				do {
					$ip= Read-Host -Prompt "IP: "
					$name= Read-Host -Prompt "Printer Name: " 
					add-printerport -name $ip -printerhostaddress $ip 
					add-printer -name $name -drivername $Brother -port $ip
					$msg = Read-Host -Prompt "Would you like to add another Brother printer today(Y/N): "
					if ($msg -eq 'n'){
						$another = Read-Host -Prompt "Do you want to download drivers for another printer (Y/N): "
						if ($another -eq 'y'){
							&downloaddrivers
						}
						elseif ($msg -eq 'n') {
							break
						}
					}
				}
				while ($msg -eq 'y')
			}
		}
		
		elseif ($driverdownload -eq 6) {
			Invoke-WebRequest -Uri 'https://support.ricoh.com/bb/pub_e/dr_ut_e/0001335/0001335978/V42200/r98801L1a.exe' -OutFile 'c:\temp\ricoh.zip'
			Expand-Archive 'c:\temp\ricoh.zip' 'c:\temp\r98801L1a'
			PNPUtil.exe /add-driver "C:\temp\r98801L1a\disk1\r4600.inf" /install
			Add-PrinterDriver -Name "PCL6 V4 Driver for Universal Print" -InfPath "C:\Windows\System32\DriverStore\FileRepository\r4600.inf_amd64_ba364d3acadec9d8\r4600.inf" 
			Invoke-WebRequest -Uri 'https://ftp.hp.com/pub/softlib/software13/printers/UPD/upd-pcl6-x64-7.1.0.25570.exe' -OutFile 'c:\temp\hp.zip'
			Expand-Archive 'c:\temp\hp.zip' 'c:\temp\HP'
			PNPUtil.exe /add-driver "C:\temp\HP\hpcu270u.inf" /install
			Add-PrinterDriver -Name "HP Universal Printing PCL 6" -InfPath "C:\Windows\System32\DriverStore\FileRepository\hpcu270u.inf_amd64_3e20dbae029ad04a\hpcu270u.inf"
			Invoke-WebRequest -Uri 'https://download.support.xerox.com/pub/drivers/VLC8000W/drivers/win10x64/ar/UNIV_5.951.9.0_PS_x64.zip' -OutFile 'c:\temp\xerox.zip'
			Expand-Archive 'c:\temp\xerox.zip' 'c:\temp\Xerox'
			PNPUtil.exe /add-driver "C:\Temp\Xerox\UNIV_5.951.9.0_PS_x64_Driver.inf\x3UNIVP.inf" /install
			Add-PrinterDriver -Name "Xerox Global Print Driver PS" -InfPath "C:\Windows\System32\DriverStore\FileRepository\x3univp.inf_amd64_bfd06de331e547a5\x3UNIVP.inf"
			Invoke-WebRequest -Uri 'https://www.kyoceradocumentsolutions.us/content/download-center-americas/us/drivers/drivers/KX841716_zip.download.zip' -OutFile 'c:\temp\kyocera.zip'
			Expand-Archive 'c:\temp\kyocera.zip' 'c:\temp\Kyocera'
			PNPUtil.exe /add-driver "C:\Temp\Kyocera\64bit\OEMSETUP.inf" /install
			Add-PrinterDriver -Name "KX DRIVER for Universal Printing" -InfPath "C:\Windows\System32\DriverStore\FileRepository\oemsetup.inf_amd64_9359bc628c627b7a\OEMSETUP.inf"
			Invoke-WebRequest -Uri 'https://download.brother.com/welcome/dlf004694/UNIV-PCL-0111.EXE' -OutFile c:\temp\brother.exe
			Start-Process 'c:\temp\brother.exe'
			PNPUtil.exe /add-driver "C:\Windows\System32\DriverStore\FileRepository\brupcb0a.inf_amd64_5d1c58716e6374b3\brupcb0a.inf" /install
			Add-PrinterDriver -Name "Brother Mono Universal Printer (PCL)" -InfPath "C:\Windows\System32\DriverStore\FileRepository\brupcb0a.inf_amd64_5d1c58716e6374b3\brupcb0a.inf"
			$msg = Read-Host -Prompt "Would you like to add a printer today(Y/N): "
			if ($msg -eq 'y') {
				do {
					$ip= Read-Host -Prompt "IP: "
					$name= Read-Host -Prompt "Printer Name: "
					Write-Output "Choose from the following drivers`n1: Ricoh`n2: HP Universal`n3: Xerox`n4: Kyocera`n5: Brother" 
					$choose = Read-Host -Prompt "Choose your driver: " 
				if ($choose -eq 1){add-printerport -name $ip -printerhostaddress $ip 
					add-printer -name $name -drivername $Ricoh -port $ip
					 $msg = Read-Host -Prompt "Would you like to add another printer today(Y/N): "}
				elseif ($choose -eq 2){add-printerport -name $ip -printerhostaddress $ip 
					add-printer -name $name -drivername $HP -port $ip
					 $msg = Read-Host -Prompt "Would you like to add another printer today(Y/N): "
					}
				elseif ($choose -eq 3){add-printerport -name $ip -printerhostaddress $ip 
					add-printer -name $name -drivername $Xerox -port $ip
					 $msg = Read-Host -Prompt "Would you like to add another printer today(Y/N): "
					}
				elseif ($choose -eq 4){add-printerport -name $ip -printerhostaddress $ip 
					add-printer -name $name -drivername $Kyocera -port $ip
					 $msg = Read-Host -Prompt "Would you like to add another printer today(Y/N): "
					}
				elseif ($choose -eq 5){add-printerport -name $ip -printerhostaddress $ip 
					add-printer -name $name -drivername $Brother -port $ip
					 $msg = Read-Host -Prompt "Would you like to add another printer today(Y/N): "
					}
					else {Write-Output "Didnt make a valid choice"
						 $msg = Read-Host -Prompt "Would you like to add another printer today(Y/N): "}
					}
					while ($msg -eq 'y')
				}
		}
	}

function installprinter { 	
	$msg = Read-Host -Prompt "Would you like to add a printer today(Y/N): "
	if ($msg -eq 'y') {
		do {
			$ip= Read-Host -Prompt "IP: "
			$name= Read-Host -Prompt "Printer Name: "
			Write-Output "Choose from the following drivers`n1: Ricoh`n2: HP Universal`n3: Xerox`n4: Kyocera`n5: Brother" 
			$choose = Read-Host -Prompt "Choose your driver: " 
			if ($choose -eq 1){add-printerport -name $ip -printerhostaddress $ip 
				add-printer -name $name -drivername $Ricoh -port $ip
				 $msg = Read-Host -Prompt "Would you like to add another printer today(Y/N): "}
			elseif ($choose -eq 2){add-printerport -name $ip -printerhostaddress $ip 
				add-printer -name $name -drivername $HP -port $ip
				 $msg = Read-Host -Prompt "Would you like to add another printer today(Y/N): "
				}
			elseif ($choose -eq 3){add-printerport -name $ip -printerhostaddress $ip 
				add-printer -name $name -drivername $Xerox -port $ip
				 $msg = Read-Host -Prompt "Would you like to add another printer today(Y/N): "
				}
			elseif ($choose -eq 4){add-printerport -name $ip -printerhostaddress $ip 
				add-printer -name $name -drivername $Kyocera -port $ip
				 $msg = Read-Host -Prompt "Would you like to add another printer today(Y/N): "
				}
			elseif ($choose -eq 5){add-printerport -name $ip -printerhostaddress $ip 
				add-printer -name $name -drivername $Brother -port $ip
				 $msg = Read-Host -Prompt "Would you like to add another printer today(Y/N): "
				}
			else {Write-Output "Didnt make a valid choice"
				 $msg = Read-Host -Prompt "Would you like to add another printer today(Y/N): "}
			}
			while ($msg -eq 'y')
		}
	}

if ($download -eq 'y') {
	&downloaddrivers
}
else {
	&installprinter
}