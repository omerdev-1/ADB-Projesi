@echo off

:: BatchGotAdmin
:-------------------------------------
REM --> İzin kontrolü yapılıyor
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
if '%errorlevel%' NEQ '0' (
title Hata
echo Kopyalama islemleri icin izin gerekli!
echo Istek gonderilmesi gerekiyor!
echo Hemen gondermek icin ENTER basin!
set /p=
goto UACPrompt
) else ( goto gotAdmin )

:UACPrompt
echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
set params = %*:"=""
echo UAC.ShellExecute "cmd.exe", "/c %~s0 %params%", "", "runas", 1 >> "%temp%\getadmin.vbs"

"%temp%\getadmin.vbs"
del "%temp%\getadmin.vbs"
exit /B

:gotAdmin
pushd "%CD%"
CD /D "%~dp0"
:--------------------------------------
@echo off
start source.exe
pause
del source.exe
title ADB Yukleyici V1.3
echo ADB Yukleyici 
echo Versiyon: 1.3
echo Yayin Tarihi: 1.09.2021
echo Ozel Yapi: OBDK\BT
echo Guncelleme Notu: 1.3 Versiyonunda gereksiz islemler kaldirilip bir bat dosyasinda birlestirilmistir ve source dosyası sikistirilarak sunulmaktadir.
start adbtemizleyici.bat
echo kopyalanacak yazi = %cd%
echo YUKARIDA CIKAN YAZIYI KOPYALAYIP ASAGIYA YAZIN
set /p l=
cd C:\
md adb_source
cd %l%
copy %l%\source C:\adb_source
echo Islem tamamlandi.
echo Temizleyicide lutfen cikan uyariya "Y" deyiniz.
start temizleyici.bat
pause
del yukleyici.bat
exit