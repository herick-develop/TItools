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
set DIR_REG= C:\Atalhos-Registro

::

          echo todos | Xcopy %1\Apps\ C:\  /E /H /C /I


          IF EXIST "C:\Program Files (x86)" (
               GOTO x64
          ) ELSE (
               GOTO x32
          )

          :x64
               IF EXIST "C:\Program Files\Firebird" (
                    GOTO Registro_NFS
               ) else (
                    start /w C:\Registro_NFS\Dependencias\FirebirdV256270200x64.exe /silent /suppressmsgboxes /norestart /nocancel
                    GOTO Registro_NFS
               )

          :x32
               IF EXIST "C:\Program Files (x86)\Firebird" (
                    GOTO Registro_NFS
               ) else (
                    start /w C:\Dependencias\FirebirdV213181850x32.exe /silent /suppressmsgboxes /norestart /nocancel
                    GOTO Registro_NFS
               )
               
          :Registro_NFS

               echo todos | Xcopy /S /I %DIR_REG%\NFS.lnk "C:\Users\%username%\Desktop"
               start /w %DIR_REG%\nfs.reg

               goto End

:End
