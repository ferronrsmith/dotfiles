@echo off
echo Configuring symlinks

mklink /D %HOMEPATH%\.vim C:\cygwin64\home\ferron\personal_git\vimfiles
mklink /H %HOMEPATH%\.vimrc C:\cygwin64\home\ferron\personal_git\dotfiles\vim\.vimrc
mklink /H %HOMEPATH%\.vwrapper C:\cygwin64\home\ferron\personal_git\dotfiles\vim\vwrapper\.vwrapper

pause