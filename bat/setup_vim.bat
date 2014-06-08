@echo off
echo Configuring symlinks

mklink /D %HOMEPATH%\.vim %CYGWIN_PATH%\home\ferron\personal_git\vimfiles
mklink /H %HOMEPATH%\.vimrc %CYGWIN_PATH%\home\ferron\personal_git\dotfiles\vim\.vimrc
mklink /H %HOMEPATH%\.vwrapper %CYGWIN_PATH%\home\ferron\personal_git\dotfiles\vim\vwrapper\.vwrapper

mklink /D %CYGWIN_PATH%\home\ferron\.VirtualBox %HOMEPATH%\.VirtualBox
mklink /D "%CYGWIN_PATH%\home\ferron\VirtualBox VMs" "%HOMEPATH%\VirtualBox VMs"

pause