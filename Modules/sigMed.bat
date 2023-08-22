:::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: DESENVOLVIDO POR Herick Lucas                    :::
:: hericklucas.hlf@gmail.com		            :::
:::::::::::::::::::::::::::::::::::::::::::::::::::::::

:: Configura��es Globais
@Echo off
title TITools
color 3
::
:: Variaveis
set DIR_TITOOLS= \\000.000.000.000\
set DIR_REG= C:\Med\Atalhos-Registro
::
          echo todos | Xcopy %1\Apps\Med C:\Med  /E /H /C /I

          IF EXIST "C:\Program Files (x86)" (
               GOTO x64
          ) ELSE (
               GOTO x32
          )

          :x64
               IF EXIST "C:\Program Files\Firebird" (
                    GOTO RegistroMed
               ) else (
                    start /w C:\Med\Dependencias\FirebirdV256270200x64.exe /silent /suppressmsgboxes /norestart /nocancel
                    GOTO RegistroMedja
               )

          :x32
               IF EXIST "C:\Program Files (x86)\Firebird" (
                    GOTO RegistroMed
               ) else (
                    start /w C:\Med\Dependencias\FirebirdV213181850x32.exe /silent /suppressmsgboxes /norestart /nocancel
                    GOTO RegistroMed
               )
               
          :RegistroMed

               cls
               Echo.
               Mode Con: lines=30 Cols=91

               echo  ��������������������������������������������������������������������������������������ͻ
               echo  �                                                                                      �
               echo  � Registro    Med                                                                  H.L �
               echo  �                                                                                      �
               echo  ��������������������������������������������������������������������������������������͹
               echo  �                                                                                      �
               echo  � �������������������������ͻ �������������������������ͻ �������������������������ͻ  �
               echo  � �������������������������͹ �������������������������͹ �������������������������͹  �
               echo  � �1: R.Cascavel            � �2: R.Toledo              � �3: R.Umuarama            �  �
               echo  � �������������������������ͼ �������������������������ͼ �������������������������ͼ  �
               echo  � �������������������������ͻ �������������������������ͻ �������������������������ͻ  �
               echo  � �������������������������͹ �������������������������͹ �������������������������͹  �
               echo  � �4: R.Umuarama Int / Ext  � �5: R.Umuarama / Toledo   � �6: R.Umu. / Tol. / Casc. �  �
               echo  � �������������������������ͼ �������������������������ͼ �������������������������ͼ  �
               echo  � �������������������������͹ �������������������������͹ �������������������������͹  �
               echo  � �7:R. Umu/Tol/Casc/Cacoal � �                         � �                         �  �
               echo  � �������������������������ͼ �������������������������ͼ �������������������������ͼ  �
               echo  �                                                                                      �
               echo  ��������������������������������������������������������������������������������������͹
               echo  �                                                                                      �
               echo  � \: Voltar ����������������������������������������������۲������������������ /: Sair �
               echo  �                                                                                      �
               echo  ��������������������������������������������������������������������������������������ͼ

               echo.

               set escolha=0
               set /p "escolha= "
               
               if %escolha% EQU 1 (
                    goto RCascavel
               ) else if %escolha% EQU 2 (
                    goto RToledo
               ) else if %escolha% EQU 3 (
                    goto RUmuarama
               ) else if %escolha% EQU 4 (
                    goto RUmuarama/Interno/Externo
               ) else if %escolha% EQU 5 (
                    goto RUmuarama/Toledo
               ) else if %escolha% EQU 6 (
                    goto RUmuarama/Toledo/Cascavel
               ) else if %escolha% EQU 7 (
                    goto RUmuarama/Toledo/Cascavel/Cacoal
               ) else if %escolha% EQU \ (
                    goto Inicio
               ) else if %escolha% EQU / (
                    goto Sair
               ) else (
                    echo Tecla Invalida & pause & goto Inicio
               )
          
          :RCascavel
               echo todos | Xcopy /S /I %DIR_REG%\med-cascavel\Med-Cascavel.lnk "C:\Users\%username%\Desktop"
               start /w %DIR_REG%\med-cascavel\med-cascavel.reg

	       GOTO End

          :RToledo
               echo todos | Xcopy /S /I %DIR_REG%\med-toledo\Med-Toledo.lnk "C:\Users\%username%\Desktop"
               start /w %DIR_REG%\med-toledo\med-toledo.reg

	       GOTO End

          :RUmuarama
               echo todos | Xcopy /S /I %DIR_REG%\med-umuarama\Med-Umuarama.lnk "C:\Users\%username%\Desktop"
               start /w %DIR_REG%\med-umuarama\med-umuarama.reg

	       GOTO End

          :RUmuarama/Interno/Externo
               echo todos | Xcopy /S /I %DIR_REG%\med-umuarama-interno-externo\Umuarama-Interno.lnk "C:\Users\%username%\Desktop"
               echo todos | Xcopy /S /I %DIR_REG%\med-umuarama-interno-externo\Umuarama-Externo.lnk "C:\Users\%username%\Desktop"

               start /w %DIR_REG%\med-umuarama-interno-externo\med-umuarama-interno-externo.reg

	       GOTO End

          :RUmuarama/Toledo
               echo todos | Xcopy /S /I %DIR_REG%\med-umuarama-toledo\Med-Toledo.lnk "C:\Users\%username%\Desktop"
               echo todos | Xcopy /S /I %DIR_REG%\med-umuarama-toledo\Med-Umuarama.lnk "C:\Users\%username%\Desktop"

               start /w %DIR_REG%\med-umuarama-toledo\med-umuarama-toledo.reg

	       GOTO End

          :RUmuarama/Toledo/Cascavel
               echo todos | Xcopy /S /I %DIR_REG%\med-umuarama-toledo-cascavel\Med-Umuarama.lnk "C:\Users\%username%\Desktop"
               echo todos | Xcopy /S /I %DIR_REG%\med-umuarama-toledo-cascavel\Med-Toledo.lnk "C:\Users\%username%\Desktop"
               echo todos | Xcopy /S /I %DIR_REG%\med-umuarama-toledo-cascavel\Med-Cascavel.lnk "C:\Users\%username%\Desktop"

               start /w %DIR_REG%\med-umuarama-toledo-cascavel\med-umuarama-toledo-cascavel.reg

          :RUmuarama/Toledo/Cascavel/Cacoal
               echo todos | Xcopy /S /I %DIR_REG%\med-umuarama-toledo-cascavel-cacoal\Med-Umuarama.lnk "C:\Users\%username%\Desktop"
               echo todos | Xcopy /S /I %DIR_REG%\med-umuarama-toledo-cascavel-cacoal\Med-Toledo.lnk "C:\Users\%username%\Desktop"
               echo todos | Xcopy /S /I %DIR_REG%\med-umuarama-toledo-cascavel-cacoal\Med-Cascavel.lnk "C:\Users\%username%\Desktop"
               echo todos | Xcopy /S /I %DIR_REG%\med-umuarama-toledo-cascavel-cacoal\Med-Cacoal.lnk "C:\Users\%username%\Desktop"

               start /w %DIR_REG%\med-umuarama-toledo-cascavel-cacoal\med-umuarama-toledo-cascavel-cacoal.reg

:End
