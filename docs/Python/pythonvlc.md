# Python VLC Module
## MisterArk Youtube Video
```
import vlc
import os

# He has a directory with just 2 mp3 files in it. So the list has 2 entries.
L=os.listdir('.')
# Tell VLC to play the first song in the list
song = vlc.MediaPlayer(L[0])

# Play the song
song.play()

# Stop the song
song.stop()

# Pause the song
song.pause()
# Restart the song where you paused it
song.pause()

# Check to see if the song is playing. Returns 1 (True) or 0 (False)
song.is_playing() 

# Get the length of the song in milliseconds
song.get_length()

# Get how many milliseconds have played so far, current location
song.get_time()

# Set the current location in the song - in this case 80 seconds in
# He did it when the song was paused, not sure if it would work if the song was playing
song.set_time(80000)

# Get the second song
song = vlc.MediaPlayer(L[1])

# Get the current volume
song.audio_get_volume()

# Set the current volume - most likely use current volume plus or minus a number
# His current volume was 58 and now he raises it to 88. He said it goes from 0 - 100
song.audio_set_volume(88)



```
