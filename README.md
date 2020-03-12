# Google photos album downloader
(And photoframe)

## Usage
The downloader itself is the  ```update.sh ``` script. If you just want to download your album, you can remove the fim lines .

Just head over to Google Photos, and generate a shareable link for your album, and replace the URL in the script.
This script is fairly dirty, and will download everything found on the page, and assume it's an image file. If you have veideos, you might want to change the extension.
Knowing that, it will also download your profile picture, so you can ask the script to remove it, by providing its ID (IDs will never change, even if you re-download the files)

At this point the script is dirty in a sense that it will download everything, then replace the existing files, without checking first if the file exists (and save on bandwidth).

## Photoframe usage
I came up with this script because I wanted to build a "smart" photoframe that would retrieve pictures from a google photos album, save them locally and display them. 
This is intendend to run on a Raspberry Pi zero that I'd ship to my parents, and living ~15 000km away, I wanted it to be pre-configured, easy to use (they just have to plug it) and displaying local pictures (because I don't want to spend my time troubleshooting a wifi or browser issue).
Since it is running on "limited" hardware, I wanted it to be as minimal as possible, and using "standard" software. The only two dependencies needed here are ```parallel ``` perl tool(to which I delegate the parallel, and recursive logic of wget-ing the files) and ```fim``` which allows me to display the pictures in the linux framebuffer (and not having to run X, and keep things minimal).
It also has the good idea of not relying on logging into Google Photos via OAuth or any other kind of API, and just uses the "publicly" avaible webpage of your album. So no overhead, or config to do. The bad thing is that if any day Google changes the code behind the album page (mostly the photo URL), the script is likely to be broken. But we have everything saved locally, so...