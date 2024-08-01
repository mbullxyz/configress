@echo off
echo Username: runneradmin
echo Password: Qwe123!@#
echo You can login now
echo RDP CREATION SUCCESSFULL!
:check
ping 127.0.0.1 > null
cls
goto check
