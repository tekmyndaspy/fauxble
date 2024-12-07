# Fauxble
A program to automatically alternate between playing videos from folders in a main folder and videos in an intermediary folder.

# To Use:
1. Place intermediary video files in a folder named 'Intermediary' in the same folder the batch script is in.
2. Place main video folders in the a folder named 'Main' in the same folder the batch script is in.
3. Place main video files in the folders you created in step two.
4. Run fauxble.cmd.

# Example Directory Tree:

Fauxble Root  
|- Main  
|  |- main1  
|  |  |- main1v1.mp4  
|  |  |- main1v2.mp4  
|  |- main2  
|  |  |- main2v1.mp4  
|  |  |- main2v2.mp4  
|  |- main3  
|     |- main3v1.mp4  
|     |- main3v2.mp4  
|- Intermediary  
|  |- intermediary1.mp4  
|  |- intermediary2.mp4  
|  |- intermediary3.mp4  
|- fauxble.cmd  
|- README.md

# To Close:
1. Close window script is being run in. Windows opened by the script will be closed automatically.

# Other Notes:
fauxble.cmd is commented quite a bit. near the top of the file are variables to allow one to set the video player to be used and the file types that are accepted. 
by default, fauxble uses mpv and accepts mp4 and webm files.
the script will not play videos that have exclamation points in the filename, so ensure that filenames are changed accordingly
