@echo off
echo Configuring symlinks

mklink /D %HOMEPATH%\.vim %CYGWIN_PATH%\home\ferron\personal_git\vimfiles
mklink /H %HOMEPATH%\.vimrc %CYGWIN_PATH%\home\ferron\personal_git\dotfiles\vim\.vimrc
mklink /H %HOMEPATH%\.vwrapper %CYGWIN_PATH%\home\ferron\personal_git\dotfiles\vim\vwrapper\.vwrapper

mklink /D %CYGWIN_PATH%\home\ferron\dev_tools\apache-tomcat C:\dev\dev_tools\apache-tomcat-7.0.54
mklink /D %CYGWIN_PATH%\home\ferron\dev_tools\apache-maven C:\dev\dev_tools\apache-maven-3.2.1


mklink /H %CYGWIN_PATH%\home\ferron\Vagrantfile %CYGWIN_PATH%\home\ferron\personal_git\dotfiles\vagrant\Vagrantfile

mklink /D %CYGWIN_PATH%\home\ferron\.VirtualBox %HOMEPATH%\.VirtualBox
mklink /D "%CYGWIN_PATH%\home\ferron\VirtualBox VMs" "%HOMEPATH%\VirtualBox VMs"

mklink /D "%CYGWIN_PATH%\home\ferron\VirtualBox VMs" "%HOMEPATH%\VirtualBox VMs"

mklink /D "%CYGWIN_PATH%\home\ferron\Music" "%HOMEPATH%\Music"

pause