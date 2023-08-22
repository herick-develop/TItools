@echo off

color 2

echo %1 
echo %2 
robocopy "%2" "%1/%username%" /E /ZB /V /sec /COPYALL /MT:128
pause