@echo off
cd C:\ 
cd adb_source
cop 
title ADB Komut Istemi
cls
:Line
@echo off
set /p "command=>"
@echo on
adb %command%
goto :Line
