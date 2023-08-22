:::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: DESENVOLVIDO POR Herick Lucas                    :::
:: hericklucas.hlf@gmail.com		            :::
:::::::::::::::::::::::::::::::::::::::::::::::::::::::

:: Configura��es Globais       
@Echo off
title TITools
color 3
::
::set DIR_TITOOLS= \\000.000.000.000\
set DIR_REG= C:\Atalho_Variavel

::

          echo todos | Xcopy %1\Apps\ C:\  /E /H /C /I


          IF EXIST "C:\Program Files (x86)" (
               GOTO x64
          ) ELSE (
               GOTO x32
          )

          :x64
               GOTO Variavel

          :x32
               GOTO Variavel
        
               
          :Variavel

               echo todos | Xcopy /S /I %DIR_REG%\app.lnk "C:\Users\%username%\Desktop"
               setx CLASSPATH \\000.000.000.000\app\Lib\gts.zip;\\000.000.000.00\app\Lib\gxclassr.zip;\\000.000.000.000\app\Lib\swt.jar;\\000.000.000.000\app\Lib\iText.jar;\\000.000.000.000\app\Lib\db2jcc_license_cu.jar;\\000.000.000.000\app\Lib\db2jcc.jar;\\000.000.000.000\app\Lib\mail.jar;\\000.000.000.000\app\Lib\activation.jar;\\000.000.000.000\Lib\comm.jar;\\000.000.000.000\app\Lib\Nfe.zip;\\000.000.000.000\app\Prog

:End
pause
