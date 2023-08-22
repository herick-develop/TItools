:::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: DESENVOLVIDO POR Herick Lucas                    :::
:: hericklucas.hlf@gmail.com		            :::
:::::::::::::::::::::::::::::::::::::::::::::::::::::::

:: Configura็๕es Globais       
@Echo off
title TITools
color 3
::
::set DIR_TITOOLS= \\000.000.000.000\
set DIR_REG= C:\Paf\Atalhos-Registro

::

          echo todos | Xcopy %1\Apps\Paf C:\Paf  /E /H /C /I


          IF EXIST "C:\Program Files (x86)" (
               GOTO x64
          ) ELSE (
               GOTO x32
          )

          :x64
               IF EXIST "C:\Program Files\Firebird" (
                    GOTO RegistroPaf
               ) else (
                    start /w C:\Paf\Dependencias\FirebirdV256270200x64.exe /silent /suppressmsgboxes /norestart /nocancel
                    GOTO RegistroPaf
               )

          :x32
               IF EXIST "C:\Program Files (x86)\Firebird" (
                    GOTO RegistroPaf
               ) else (
                    start /w C:\Paf\Dependencias\FirebirdV213181850x32.exe /silent /suppressmsgboxes /norestart /nocancel
                    GOTO RegistroPaf
               )
               
          :RegistroPaf

               cls
               Echo.
               Mode Con: lines=30 Cols=91

               echo  ษออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป
               echo  บ                                                                                      บ
               echo  บ Registro    Paf                                                                  H.L บ
               echo  บ                                                                                      บ
               echo  ฬออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออน
               echo  บ                                                                                      บ
               echo  บ ษอออออออออออออออออออออออออป ษอออออออออออออออออออออออออป ษอออออออออออออออออออออออออป  บ
               echo  บ ฬอออออออออออออออออออออออออน ฬอออออออออออออออออออออออออน ฬอออออออออออออออออออออออออน  บ
               echo  บ บ1: R.Interno             บ บ2: R.Externo             บ บ3: Interno / R.Externo   บ  บ
               echo  บ ศอออออออออออออออออออออออออผ ศอออออออออออออออออออออออออผ ศอออออออออออออออออออออออออผ  บ
               echo  บ ษอออออออออออออออออออออออออป ษอออออออออออออออออออออออออป ษอออออออออออออออออออออออออป  บ
               echo  บ ฬอออออออออออออออออออออออออน ฬอออออออออออออออออออออออออน ฬอออออออออออออออออออออออออน  บ
               echo  บ บ4: R.Somente Cacoal      บ บ5: R.Externo Cacoal      บ บ6: R.Umuarama / Cacoal   บ  บ
               echo  บ ศอออออออออออออออออออออออออผ ศอออออออออออออออออออออออออผ ศอออออออออออออออออออออออออผ  บ
               echo  บ                                                                                      บ
               echo  ฬออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออน
               echo  บ                                                                                      บ
               echo  บ \: Voltar ฑฑฑฑฑฑฑฑฑฑฑฒฒฒฒฒฒฒฒฒÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛฒฒฒฒฒฒฒฒฒฑฑฑฑฑฑฑฑฑฑ /: Sair บ
               echo  บ                                                                                      บ
               echo  ศออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ

               echo.

               set escolha=0
               set /p "escolha= "
               
               if %escolha% EQU 1 (
                    goto RInterno
               ) else if %escolha% EQU 2 (
                    goto RExterno
               ) else if %escolha% EQU 3 (
                    goto RInternoExterno
               ) else if %escolha% EQU 4 (
                    goto RSomenteCacoal
               ) else if %escolha% EQU 5 (
                    goto RExternoCacoal
               ) else if %escolha% EQU 6 (
                    goto RUmuaramaCacoal
               ) else if %escolha% EQU \ (
                    goto Inicio
               ) else if %escolha% EQU / (
                    goto Sair
               ) else (
                    echo Tecla Invalida & pause & goto Inicio
               )
          
          :RInterno
               echo todos | Xcopy /S /I %DIR_REG%\paf_interno\Paf-Interno.lnk "C:\Users\%username%\Desktop"
               start /w %DIR_REG%\paf_interno\registro-interno-paf.reg

               goto End

          :RExterno
               echo todos | Xcopy /S /I %DIR_REG%\paf_externo\Paf-Externo.lnk "C:\Users\%username%\Desktop"
               start /w %DIR_REG%\paf_externo\registro-externo-paf.reg

               goto End

          :RInternoExterno
               echo todos | Xcopy /S /I %DIR_REG%\interno_externo\Paf-Interno.lnk "C:\Users\%username%\Desktop"
               echo todos | Xcopy /S /I %DIR_REG%\interno_externo\Paf-Externo.lnk "C:\Users\%username%\Desktop"

               start /w %DIR_REG%\paf_interno_externo\registro-interno-externo-paf.reg

               goto End

          :RSomenteCacoal
               echo todos | Xcopy /S /I %DIR_REG%\paf_somente_cacoal\Paf-Cacoal.lnk "C:\Users\%username%\Desktop"
               start /w %DIR_REG%\paf_somente_cacoal\registro-somente-cacoal-paf.reg

               goto End

          :RExternoCacoal
               echo todos | Xcopy /S /I %DIR_REG%\paf_externo_cacoal\Paf-Cacoal-Externo.lnk "C:\Users\%username%\Desktop"
               start /w %DIR_REG%\paf_externo_cacoal\registro-externo-paf-cacoal.reg

               goto End

          :RUmuaramaCacoal
               echo todos | Xcopy /S /I %DIR_REG%\paf_umuarama_cacoal\Paf-Umuarama.lnk "C:\Users\%username%\Desktop"
               echo todos | Xcopy /S /I %DIR_REG%\paf_umuarama_cacoal\Paf-Cacoal.lnk "C:\Users\%username%\Desktop"

               start /w %DIR_REG%\paf_umuarama_cacoal\registro-umuarama-cacoal-paf.reg

:End
