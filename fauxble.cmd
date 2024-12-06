:: Initial version created by tekmyndaspy

@echo off

:: set videoplayer and commandline flags to play video
:: set directories to pull videos from
:: videoplayer variable takes the command to run the videoplayer and flags to pass to the videoplayer and nothing else
:: filetypes variable accepts a list of filetypes delineated by spaces and using stars in place of the potential filename
set videoplayer=mpv --fs --volume=50
set filetypes=*.mp4 *.webm
set maindirectory=Main
set intermediarydirectory=Intermediary

:: evaluate !! variable evaluations
setlocal enableDelayedExpansion

:: set window title to 'fauxble'
title Fauxble

echo Starting Fauxble.



:chooseshow 

echo Choosing show.

:: move to shows directory in same folder as batch file
cd /d "%~dp0\%maindirectory%"

:: count total folders in working directory and store into array
set /a "i=0"
for /d %%d in (*) do (
	set /a "i+=1"
	set "directorylist[!i!]=%%~d"
)

echo Moving to !directorylist[%rnd%]!.

:: move to random folder in shows folder
set /a rnd="%random% %%%i% +1"
cd "!directorylist[%rnd%]!"

echo Choosing episode.

:: count total of chosen filetypes and store into array
set /a "i=0"
for %%f in (%filetypes%) do (
	set /a "i+=1"
	set "videolist[!i!]=%%~f"
)

:: get random number between 1 and array size
set /a rnd="%random% %%%i% +1"

echo Playing !videolist[%rnd%]!.

:: play random episode
start /wait %videoplayer% "!videolist[%rnd%]!"

:: remove selected video from array
set videolist[%rnd%]=ERRORNOVIDEOCHOSEN



echo Choosing bumper.

cd /d "%~dp0\%intermediarydirectory%"

:: count total of chosen filetypes and store into array
set /a "i=0"
for %%f in (%filetypes%) do (
	set /a "i+=1"
	set "videolist[!i!]=%%~f"
)

:: get random number between 1 and array size
set /a rnd="%random% %%%i% +1"

echo Playing !videolist[%rnd%]!.

:: play random bumper
start /wait %videoplayer% "!videolist[%rnd%]!"

:: remove selected video from array
set videolist[%rnd%]=ERRORNOVIDEOCHOSEN

timeout /t 10

:: jump to :chooseshow label near beginning of program
goto chooseshow

pause
