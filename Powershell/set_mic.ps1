# indevice=3: usb microphone
# outdevice=3: CABLE Input
(Get-Content "C:\Users\dbao\arepeater23\config.ini") -replace 'indevice=\d', 'indevice=3' | Set-Content "C:\Users\dbao\arepeater23\config.ini"
& "C:\Users\dbao\arepeater23\Autostart.exe"

Start-Sleep 5

# indevice=0: bluetooth microphone
(Get-Content "C:\Users\dbao\arepeater23\config.ini") -replace 'indevice=\d', 'indevice=0' | Set-Content "C:\Users\dbao\arepeater23\config.ini"
& "C:\Users\dbao\arepeater23\Autostart.exe"

