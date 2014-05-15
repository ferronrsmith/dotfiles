@echo off
echo Configuring symlinks

mklink /D %HOMEPATH%\.vim C:\cygwin64\home\ferron\personal_git\vimfiles
mklink /H %HOMEPATH%\.vimrc C:\cygwin64\home\ferron\personal_git\dotfiles\vim\.vimrc

pause