@setlocal
@echo off
title LTSC
cd /d "%~dp0"
busybox sh -c ./core.sh
@endlocal
@exit
