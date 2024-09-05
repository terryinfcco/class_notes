# Youtube Video 2022

- E-paper not e-ink

## Introduction and Setup

- Can hold information indefinitely without power
- Uses SPI interface and only Master Output Serial Interface is used, not the input because the e-paper display doesn't return any data to the host
- He's not going to use the push buttons. So I'll have to get that info elsewhere
- Have to use raspi-config to turn on spi in the interfaces section.
- He grabbed `https://github.com/waveshare/e-Paper`
- then went to `e-Paper/RaspberryPI_JetsonNano/python/examples`
- `python3 epd_2in7_test.py` to test that everything is OK

## Python Programming

- in `e-paper/RaspberryPi_JetsonNano/python/lib` is a directory called `waveshare_epd`
- he copied that folder into a `mypython` folder where he's going to do his development
- he created `mypython/pic` where he put the images he's going to use. 
- he said `.bmp` files are the easiest to use but can also use `.png` but backgrounds won't be transparent in png files
- he put `Avenir Next.ttc` in the pic folder also. It's a truetype font file he got on github

## Code for his example

```
# import required python libraries
import os

# get display from Waveshare library
from waveshare_epd import epd2in7

# get functions from Pillow
from PIL import Image, ImageDraw, ImageFont

# image directory
pic_dir = 'pic'

try:
    # initialize display
    epd_disp = epd2in7.EPD()
    epd_disp.init()
    
    # clear display, 0 is black, 255 is white
    epd_disp.Clear(255)
    
    # reverse width and height as display is sideways
    w = epd_disp.height
    h = epd_disp.width
    print('width', w)
    print('height', h)
    
    #define fonts
    # the 18 and 16 are the font sizes
    # It's different for every font, but here index=1 is bold, and index=5 is a light font
    top_font = ImageFont.truetype(os.path.join(pic_dir, 'Avenir Next.ttc'), 18, index=1)
    bottom_font = ImageFont.truetype(os.path.join(pic_dir, 'Avenir Next.ttc'), 16, index=5)
    
    # define and draw background
    # This draws to a buffer, not to the screen
    image = Image.new(mode='1', size=(w, h),color=255)
    draw = ImageDraw.Draw(image)
    
    # position and draw text
    # fill=0 means no background behind or underneath the character.
    draw.text((15, 0), 'Welcome to the Workshop!', font=top_font, fill=0, align='left')
    draw.text((10, 150), 'https://dronebotworkshop.com', font=bottom_font, fill=0, align='left')
    
    # get robot image 
    dbwsbot = Image.open('pic/dbws-robot.bmp')
    
    # paste image onto background image
    image.paste(dbwsbot, (80, 35))
    
    # write buffer contents to display
    epd_disp.display(epd_disp.getbuffer(image))
    
except IOError as e:
    print(e)
    
```

## PaperPi

- `https://github.com/txoof/epd_display`
- that link redirects to `https://github.com/txoof/PaperPi`
- Not sure how much of his instructions are still relevant, but I'll show them anyway
- launch paperpi `./paperpi/dist/paperpi` and it builds a configuration file
- edit the config file `vim ~/.config/com.txoof.paperpi/paperpi.ini`
- change display_type to epd2in7
- now run paperpi again and get the demo screen
- Then need to activate a plugin so edit the config file again
- go to the bottom and find the Basic Clock plugin and inside the brackets delete the x so it just says `[Plugin: Basic Clock]`
- He also uncommented the weather plugin and changed location name to Montreal and put in the latitude and longitude
- With multiple plugins, it cycles through the plugins.
- Most of the plugins would look better on a larger e-paper display

