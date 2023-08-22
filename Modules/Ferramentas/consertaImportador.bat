@echo off

color 2

set isBalcao="BIG_balcao"

IF EXIST "C:\BIG\BIG_balcao" (
    echo todos | Xcopy "\\000.000.000.000\" "C:\BIG\BIG_balcao" /E /H /C /I

) ELSE (
    set isBalcao="BIG_esc"
    echo todos | Xcopy "\\000.000.000.000\" "C:\BIG\BIG_esc" /E /H /C /I
)
echo todos | copy "C:\BIG\%isBalcao%\IMPORTADOR.lnk" "C:\Users\%username%\Desktop"
echo todos | copy "C:\BIG\%isBalcao%\Clientes.lnk" "C:\Users\%username%\Desktop"