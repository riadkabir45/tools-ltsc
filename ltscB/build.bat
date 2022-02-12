@setlocal
@echo off

title %~n0

7zr a archive.7z busybox.exe core.sh lib.sh LTSC-Loader.bat skus.zip > nul && echo I : Packing files
copy /b 7zSD.sfx + config.txt + archive.7z LTSC-Activaror.exe > nul && echo I : Baking the EXE
del /s /q archive.7z > nul && echo I : cleaning files
pause

@endlocal
@exit /b 0