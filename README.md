# Linux-Ubuntu-Wallpaper-Changer
A bash script for Ubuntu (Linux) OS which will download wallpaper from Bing.com and set that image as your system's wallpaper and lock screen.

### How to use:
First of all create a directory under /home/YOUR_USERNAME/Pictures directory with name **_bing_**. So directory path should be **_/home/YOUR_USERNAME/Pictures/bing_**.

Now download or create **bing_image.sh** bash script file inside **_bing_** directory and give it full permission by **777**.

`sudo chmod 777 bing_image.sh`


### Create cron to execute this script
Basically Bing.com provides a wallpaper daily at **8:00AM UTC**. As I'm in India and my timezone is **IST(+5:30)** that's why new wallpaper will be available at **13:30 IST** in my location.
So I'll create a cron to execute my script at **13:40** *(+10 Minutes margin to avoid some cache issue) and it is possible be running following commands on terminal.

First edit cron file by

`crontab -e`


Then add following line at the end of the file:

`40 13 * * * . /home/YOUR_USERNAME/Pictures/bing/bing_image.sh > /home/YOUR_USERNAME/Pictures/bing/bing.log 2>&1`


And then save and exit editing by pressing **Esc** button and type

`:wq`


This will add new cron settings which will perform execution at 13:40 everyday.

That's it. Enjoy :)

Thanks
Alauddin Ansari