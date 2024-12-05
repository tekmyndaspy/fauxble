:: Fauxble Version 1.0.0
:: Initial version created by tekmyndaspy

@echo off

:: set videoplayer and commandline flags to play video
:: videoplayer variable takes the command to run the videoplayer and flags to pass to the videoplayer and nothing else
:: filetypes variable accepts a list of filetypes delineated by spaces and using stars in place of the potential filename
set videoplayer=mpv --fs
set filetypes=*.mp4

:: evaluate !! variable evluations
setlocal enableDelayedExpansion

:: set window title to 'fauxble'
title Fauxble

echo Starting Fauxble.



:chooseshow 

echo Choosing show.

:: move to shows directory in same folder as batch file
cd /d "%~dp0\Shows"

:: count total folders in working directory and store into array
set /a "i=0"
for /d %%d in (*) do (
	set /a "i+=1"
	set "directorylist[!i!]=%%~d"
)

:: move to random folder in shows folder
set /a rnd="%random% %%%i% +1"
cd "!directorylist[%rnd%]!"

echo Playing episode.

:: count total of chosen filetypes and store into array
set /a "i=0"
for %%f in (%filetypes%) do (
	set /a "i+=1"
	set "videolist[!i!]=%%~f"
)

:: get random number between 1 and array size
set /a rnd="%random% %%%i% +1"

:: play random episode
start /wait %videoplayer% "!videolist[%rnd%]!"



echo Playing bumper.

cd /d "%~dp0\Bumpers"

:: count total of chosen filetypes and store into array
set /a "i=0"
for %%f in (%filetypes%) do (
	set /a "i+=1"
	set "videolist[!i!]=%%~f"
)

:: get random number between 1 and array size
set /a rnd="%random% %%%i% +1"

:: play random bumper
start /wait %videoplayer% "!videolist[%rnd%]!"

timeout /t 10

:: jump to :chooseshow label near beginning of program
goto chooseshow

pause