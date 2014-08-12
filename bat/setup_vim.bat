@echo off
echo Configuring symlinks

mklink /D %HOMEPATH%\.vim %CYGWIN_PATH%\home\ferron\personal_git\vimfiles
mklink /H %HOMEPATH%\.vimrc %CYGWIN_PATH%\home\ferron\personal_git\dotfiles\vim\.vimrc
mklink /H %HOMEPATH%\.vwrapper %CYGWIN_PATH%\home\ferron\personal_git\dotfiles\vim\vwrapper\.vwrapper
mklink /D %CYGWIN_PATH%\home\ferron\dev_tools\apache-tomcat C:\dev\dev_tools\apache-tomcat-7.0.54
mklink /D %CYGWIN_PATH%\home\ferron\dev_tools\apache-maven C:\dev\dev_tools\apache-maven-3.2.1
mklink /D %CYGWIN_PATH%\home\ferron\dev_tools\elasticsearch C:\dev\dev_tools\elasticsearch
mklink /D %CYGWIN_PATH%\home\ferron\dev_tools\php C:\dev\dev_tools\php-5.3.28-nts-Win32-VC9-x86
mklink /D C:\php C:\dev\dev_tools\php-5.3.28-nts-Win32-VC9-x86\ext
mklink /D %CYGWIN_PATH%\home\ferron\dev\workspace C:\dev
mklink /H %CYGWIN_PATH%\home\ferron\Vagrantfile %CYGWIN_PATH%\home\ferron\personal_git\dotfiles\vagrant\Vagrantfile
mklink /D %CYGWIN_PATH%\home\ferron\.VirtualBox %HOMEPATH%\.VirtualBox
mklink /D "%CYGWIN_PATH%\home\ferron\VirtualBox VMs" "%HOMEPATH%\VirtualBox VMs"
mklink /D "%CYGWIN_PATH%\home\ferron\Music" "%HOMEPATH%\Music"

pause