:: Initial version created by tekmyndaspy
:: "smoking pot and programming camp, i don't give a shit" from casket
:: "fuck batch. me and my homies all hate batch" from tekmyndaspy

@echo off

:: set videoplayer and commandline flags to play video
:: set directories to pull videos from
:: set wait period between intermediary and main videos
:: videoplayer variable takes the command to run the videoplayer and flags to pass to the videoplayer and nothing else
:: filetypes variable accepts a list of filetypes delineated by spaces and using stars in place of the potential filename
set videoplayer=mpv --fs --volume=50
set filetypes=*.mp4 *.webm
set maindirectory=Main
set intermediarydirectory=Intermediary
set waitperiod=0

:: evaluate !! variable evaluations
setlocal enableDelayedExpansion

:: set window title to 'fauxble'
title Fauxble

echo Starting Fauxble.



:chooseshow 

echo Choosing main category.

:: move to shows directory in same folder as batch file
cd /d "%~dp0\%maindirectory%"

:: count total folders in working directory and store into array
set /a "i=0"
for /d %%d in (*) do (
	set /a "i+=1"
	set "directorylist[!i!]=%%~d"
)

:: move to random folder in main folder array
set /a rnd="%random% %%%i% +1"
echo Moving to !directorylist[%rnd%]!.
cd "!directorylist[%rnd%]!"

echo Choosing main video.

:: count total of chosen filetypes and store into array
set /a "i=0"
for %%f in (%filetypes%) do (
	set /a "i+=1"
	set "videolist[!i!]=%%~f"
)

:: play random video in video array
set /a rnd="%random% %%%i% +1"
echo Playing !videolist[%rnd%]!.
start /wait /b %videoplayer% "!videolist[%rnd%]!"

:: remove selected video from array
set videolist[%rnd%]=ERRORNOVIDEOCHOSEN



echo Choosing intermediary.

cd /d "%~dp0\%intermediarydirectory%"

:: count total of chosen filetypes and store into array
set /a "i=0"
for %%f in (%filetypes%) do (
	set /a "i+=1"
	set "videolist[!i!]=%%~f"
)

:: get random intermediary video
set /a rnd="%random% %%%i% +1"
echo Playing !videolist[%rnd%]!.
start /wait /b %videoplayer% "!videolist[%rnd%]!"

:: remove selected video from array
set videolist[%rnd%]=ERRORNOVIDEOCHOSEN

:: give period between intermediary and main video to give time to turn off script
timeout /t %waitperiod%

:: jump to :chooseshow label near beginning of program
goto chooseshow

pause
