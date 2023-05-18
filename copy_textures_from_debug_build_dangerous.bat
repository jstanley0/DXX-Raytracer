@echo off
setlocal

:prompt

echo THIS WILL DESTRUCTIVELY MIRROR THE DEBUG BUILD'S TEXTURE DIRECTORY
echo TO D1\ASSETS\TEXTURES, WHICH ACTUALLY GETS SYNCED TO GITHUB. IT WILL
echo NOT ONLY COPY THE FILES FROM THE DEBUG BUILD'S DIRECTORY, BUT IT WILL
echo DELETE ANY FILES IN D1\ASSETS\TEXTURES THAT DO NOT EXIST IN THE DEBUG
echo BUILD DIRECTORY. IF THIS IS WHAT YOU WANTED TO DO, ENTER Y. OTHERWISE,
echo ENTER N.

set /P AREYOUSURE=Are you sure (Y/[N])?
if /I "%AREYOUSURE%" NEQ "Y" GOTO end

set TEXTURE_SOURCE=out\build\directx12-win-debug\d1\assets\textures
set TEXTURE_DESTINATION=d1\assets\textures

robocopy %TEXTURE_SOURCE% %TEXTURE_DESTINATION% /MIR > nul

echo ...It's done...

:end
endlocal
