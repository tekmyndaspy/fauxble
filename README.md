# Fauxble
A program to automatically alternate between playing videos from folders in folder a and videos in folder b.

# To Use:
1. Place intermediary video files in the 'Bumpers' folder.
2. Place main video folders in the 'Shows' folder.
3. Place main video files in the folders you created in step two.
4. Run fauxble.cmd.

# Example Directory Tree:

Fauxble Root
- Shows
  - show1
    - show1s1e1.mp4
    - show1s1e2.mp4
  - show2
    - show2s1e1.mp4
    - show2s1e2.mp4
  - show3
    - show3s1e1.mp4
    - show3s1e2.mp4
- Bumpers
  - bumper1.mp4
  - bumper2.mp4
  - bumper3.mp4
- fauxble.cmd
- README.md

# To Close:
1. Close video player until the script window says it is waiting for a time period.
2. During the time period, press Ctrl+C, then press Y when it asks to terminate the batch job.

# To Close if Previous Method Does Not Work:
1. Open Task Manager.
2. Close console window associated with Fauxble.

# To Close In Dire Straits:
1. Power down host machine.

# Other Notes:
fauxble.cmd is commented quite a bit. near the top of the file are variables to allow one to set the video player to be used and the file types that are accepted. 
by default, fauxble uses mpv and accepts mp4 files.
the script will not play videos that have exclamation points in the filename, so ensure that filenames are changed accordingly
