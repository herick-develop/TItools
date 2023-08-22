:::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: DESENVOLVIDO POR Herick Lucas                    :::
:: hericklucas.hlf@gmail.com		            :::
:::::::::::::::::::::::::::::::::::::::::::::::::::::::

:: Configurações Globais       
@Echo off
title TITools
color 3
::
::set DIR_TITOOLS= \\000.000.000.000\
set DIR_REG= C:\Paf_RH\Atalhos-Registro

::

          echo todos | Xcopy %1\Apps\Paf_RH C:\Paf_RH  /E /H /C /I


          IF EXIST "C:\Program Files (x86)" (
               GOTO x64
          ) ELSE (
               GOTO x32
          )

          :x64
               IF EXIST "C:\Program Files\Firebird" (
                    GOTO RegistroPaf_RH
               ) else (
                    start /w C:\Paf_RH\Dependencias\FirebirdV256270200x64.exe /silent /suppressmsgboxes /norestart /nocancel
                    GOTO RegistroPaf_RH
               )

          :x32
               IF EXIST "C:\Program Files (x86)\Firebird" (
                    GOTO RegistroPaf_RH
               ) else (
                    start /w C:\Paf_RH\Dependencias\FirebirdV213181850x32.exe /silent /suppressmsgboxes /norestart /nocancel
                    GOTO RegistroPaf_RH
               )
               
          :RegistroPaf_RH

               echo todos | Xcopy /S /I %DIR_REG%\Paf_RH.lnk "C:\Users\%username%\Desktop"
               start /w %DIR_REG%\paf_rh.reg

               goto End

:End
