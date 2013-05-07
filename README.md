------------
### Note: This program is *NOT* affiliated with (or endorsed by) Coursera® in anyway.

#### License: [WTFPL](http://www.wtfpl.net/).
-------------

##[Coursera.org](http://www.coursera.org) course downloader

This is a quick hack to download all video lectures/pdf's from a Coursera.org's course.
 - Downloads are resumable, so you can run this script often as the course progress (provided you use the same target directory each time, and keep default names)

###Usage
```
$ ./coursera-dl.sh <URL of Lecture Index page> <Cookie File Path> [Target directory for downloads]
```

*Note:*
 - You need to be logged into coursera in your browser, and provide a link to the browser's cookie file (for authentication purpose). Usual location for Google Chrome's cookie file (on Ubuntu) is ```~/.config/google-chrome/Default/Cookies```, so once you have logged into Coursera.org with your credentials on Chrome, you can provide this path for the ```Cookie File Path``` argument. Similarly for Firefox you can find the cookie file here (in Ubuntu) ```~/.mozilla/firefox/<ProfileNameHere>/```
 - You need to have [aria2c](http://aria2.sourceforge.net) installed on your system to use the script. To install it on ubuntu: ```sudo apt-get install aria2```

###Example
To download all resources from the course, say **Introduction to Genetics and Evolution** (Note: you must be registered for it): Log into coursera, navigate to the course page, and click on *Lectures* link in the left side navigation bar. Then copy the URL (```https://class.coursera.org/geneticsevolution-2012-001/lecture/index``` in this particular case), and run the following:
```bash
$ ./coursera-dl.sh https://class.coursera.org/geneticsevolution-2012-001/lecture/index ~/.config/google-chrome/Default/Cookies ~/genetics-and-evolution
```
This will download all files in the directory ```~/genetics-and-evolution```.

------------
Post bugs and issues on [github](https://github.com/abiyani/coursera-downloader/issues). Send other comments to Anurag Biyani (```<first name><last name>@gmail.com```).
