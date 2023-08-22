::::::::::::::::::::::::::::::::::::::::::::
:: Elevate.cmd - Version 4
:: Automatically check & get admin rights
::::::::::::::::::::::::::::::::::::::::::::
@echo off
CLS
ECHO.
ECHO =============================
ECHO Running Admin shell
ECHO =============================

:init
setlocal DisableDelayedExpansion
set cmdInvoke=1
set winSysFolder=System32
set "batchPath=%~0"
for %%k in (%0) do set batchName=%%~nk
set "vbsGetPrivileges=%temp%\OEgetPriv_%batchName%.vbs"
setlocal EnableDelayedExpansion

:checkPrivileges
NET FILE 1>NUL 2>NUL
if '%errorlevel%' == '0' ( goto gotPrivileges ) else ( goto getPrivileges )

:getPrivileges
if '%1'=='ELEV' (echo ELEV & shift /1 & goto gotPrivileges)
ECHO.
ECHO **************************************
ECHO Invoking UAC for Privilege Escalation
ECHO **************************************

ECHO Set UAC = CreateObject^("Shell.Application"^) > "%vbsGetPrivileges%"
ECHO args = "ELEV " >> "%vbsGetPrivileges%"
ECHO For Each strArg in WScript.Arguments >> "%vbsGetPrivileges%"
ECHO args = args ^& strArg ^& " "  >> "%vbsGetPrivileges%"
ECHO Next >> "%vbsGetPrivileges%"

if '%cmdInvoke%'=='1' goto InvokeCmd 

ECHO UAC.ShellExecute "!batchPath!", args, "", "runas", 1 >> "%vbsGetPrivileges%"
goto ExecElevation

:InvokeCmd
ECHO args = "/c """ + "!batchPath!" + """ " + args >> "%vbsGetPrivileges%"
ECHO UAC.ShellExecute "%SystemRoot%\%winSysFolder%\cmd.exe", args, "", "runas", 1 >> "%vbsGetPrivileges%"

:ExecElevation
"%SystemRoot%\%winSysFolder%\WScript.exe" "%vbsGetPrivileges%" %*
exit /B

:gotPrivileges
setlocal & cd /d %~dp0
if '%1'=='ELEV' (del "%vbsGetPrivileges%" 1>nul 2>nul  &  shift /1)

:::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: DESENVOLVIDO POR Herick Lucas                    :::
:: hericklucas.hlf@gmail.com		            :::
:::::::::::::::::::::::::::::::::::::::::::::::::::::::

:: Configura��es Globais       
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
