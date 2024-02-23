@echo off
setlocal

REM Get the path to the folder where the batch file is located
set "ScriptDir=%~dp0"

REM Set the destination folder
set "DestinationFolder=C:\WinUp-Auto"

REM Create the destination folder if it doesn't exist
if not exist "%DestinationFolder%" (
    mkdir "%DestinationFolder%"
)

REM Copy the files
copy "%ScriptDir%config.json" "%DestinationFolder%"
copy "%ScriptDir%WinUp-Auto.exe" "%DestinationFolder%"
copy "%ScriptDir%README.MD" "%DestinationFolder%"
copy "%ScriptDir%setup.bat" "%DestinationFolder%"

REM Change the current directory to the destination folder
cd /d "%DestinationFolder%"

REM Run setup.bat
call setup.bat

echo WinUp-Auto Installed to %DestinationFolder% 
echo Navigate to %DestinationFolder% and edit the config.json file to enable Notifications
pause
