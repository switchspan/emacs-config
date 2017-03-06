@Echo Off
REM This copies over the appropriate folders and files to install on windows
Echo Installing emacs config on this copy of windows
Echo Updating files from Github ...
git pull origin master
Echo Done!
Echo Copying config files to %HOMEPATH% ...
xcopy /y /q .emacs %HOMEPATH%
xcopy /y /e /q .emacs.d %HOMEPATH%\.emacs.d
Echo Done!
