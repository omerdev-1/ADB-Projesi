@echo off
title Temizleyici
del source
del adbtemizleyici.bat
ren run.bat konsol.bat
echo gereksiz dosyalar temizlendi
echo konsol dosyasi hazirlandi
echo konsolun yuklendigi klasor acildi
explorer %cd%
echo Basarili
pause
del temizleyici.bat