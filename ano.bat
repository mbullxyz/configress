@echo off
del /f "C:\Users\Public\Desktop\Epic Games Launcher.lnk" > out.txt 2>&1
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" /V EnableAutoTray /T REG_DWORD /D 0 /F > out.txt 2>&1
net user mbullxyz narutopein /add >nul
net localgroup administrators mbullxyz /add >nul
net user mbullxyz /active:yes >nul
net user installer /delete
diskperf -Y >nul
sc config Audiosrv start= auto >nul
sc start audiosrv >nul
ICACLS C:\Windows\Temp /grant mbullxyz:F >nul
ICACLS C:\Windows\installer /grant mbullxyz:F >nul
echo Successfully installed! If RDP is dead, rebuild again.
echo IP:
tasklist | find /i "ngrok.exe" >Nul && curl -s localhost:4040/api/tunnels | jq -r .tunnels[0].public_url || echo "Failed to retreive NGROK authtoken - check again your authtoken"
echo Username: mbullxyz
echo Password: narutopein
echo You can login now
ping -n 10 127.0.0.1 >nul
echo RDP CREATION SUCCESSFULL!
tasklist | find /i "ngrok.exe" >Nul && goto check || echo "Unable to get NGROK tunnel, make sure NGROK_AUTH_TOKEN is correct in Settings > Secrets > Repository secret. Maybe your previous VM is still running: https://dashboard.ngrok.com/status/tunnels" & ping 127.0.0.1 >Nul & exit
:check
ping 127.0.0.1 > null
cls
echo RDP CREATION SUCCESSFULL!
goto check
