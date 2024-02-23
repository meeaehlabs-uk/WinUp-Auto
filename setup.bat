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

REM Schedule the task to run every time the user unlocks the system
schtasks /create /tn "WinUp-Auto" /tr "%DestinationFolder%\WinUp-Auto.exe" /sc onlogon

echo Files copied to %DestinationFolder%
echo Scheduled task added to run WinUp-Auto.exe on every unlock.
pause
