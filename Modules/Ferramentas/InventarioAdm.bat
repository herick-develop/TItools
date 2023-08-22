:::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: DESENVOLVIDO POR Herick Lucas                    :::
:: hericklucas.hlf@gmail.com		            :::
:::::::::::::::::::::::::::::::::::::::::::::::::::::::

:: Configura��es Globais  
runas /user:Administrator     
@Echo off
title TITools
color 3
cls
::
set DIR= \\000.000.000.000\

set NL=^&echo.

IF EXIST "C:\Program Files (x86)\AnyDesk" (
     for /f "delims=" %%i in ('"C:\Program Files (x86)\AnyDesk\AnyDesk.exe" --get-id') do set id=%%i
    
) ELSE (
     for /f "delims=" %%i in ('"C:\Program Files (x86)\AnyDeskMSI\AnyDeskMSI.exe" --get-id') do set id=%%i
)

echo usuario: %username% >> %DIR%"\Logs\"%username%".txt"
echo. >> %DIR%"\Logs\"%username%".txt"

echo nome do pc: >> %DIR%"\Logs\"%username%".txt"
hostname >> %DIR%"\Logs\"%username%".txt"
echo. >> %DIR%"\Logs\"%username%".txt"

echo Any Desk: %id% >> %DIR%"\Logs\"%username%".txt"
echo. >> %DIR%"\Logs\"%username%".txt"

systeminfo | findstr /B /C:"Nome do sistema operacional:" /C:"Fabricante do sistema:" /C:"Modelo do sistema:" /C:"Tipo de sistema:" >> %DIR%"\Logs\"%username%".txt"
echo. >> %DIR%"\Logs\"%username%".txt"

wmic OS get OSArchitecture >> %DIR%"\Logs\"%username%".txt"
echo. >> %DIR%"\Logs\"%username%".txt"

echo CPU: %NL% cmd | wmic cpu get name >> %DIR%"\Logs\"%username%".txt"
echo. >> %DIR%"\Logs\"%username%".txt"

echo Memorias Ram: %NL% cmd | wmic memorychip get manufacturer, partnumber, capacity, speed >> %DIR%"\Logs\"%username%".txt"
echo. >> %DIR%"\Logs\"%username%".txt"

echo exit | echo list disk | diskpart >> %DIR%"\Logs\"%username%".txt"

echo. >> %DIR%"\Logs\"%username%".txt"

exit