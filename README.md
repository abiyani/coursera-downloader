##[Coursera.org](http://www.coursera.org) course downloader

I wrote this simple bash script after I frustratingly tried to download a course's video lectures by clicking on the browser links one by one. This is a quick specialized hack (something done in < 1hr), so bugs in the code are very likely - but it did work for me (I was able to download 2 different courses I was interested in).

A simple Bash script which downloads video lectures (.mp4), and PDF files from a Coursera.org's course.
 - Downloads are resumable, and you can run the script from time to time as the course progress: provided you use the same target directory each time, it will only download the files not previously downloaded.
 - File names are preserved (it's highly recommended that you do not change them: as renaming will disable resumablity).

###Usage
```
$ ./coursera-dl.sh <URL of Lecture Index page> <Cookie File Path> [Target directory for downloads]
```

*Note:*
 - You need to be logged into coursera in your browser, and provide a link to the browser's cookie file (for authentication purpose). Usual location for Google Chrome's cookie file (at least on Ubuntu) is ```~/.config/google-chrome/Default/Cookies```, so once you have logged into Coursera.org with your credentials on Chrome, you can provide this path for the "Cookie File Path" argument. Similarly you might be able to find Firefox's cookie file in the directory: ```~/.mozilla/firefox/<ProfileNameHere>/``` (though I haven't tried it).
 - You need to have [aria2c](http://aria2.sourceforge.net) installed on your system to use the script. To install it on ubuntu: ```sudo apt-get install aria2```

###Example
To download resources from the course: **Introduction to Genetics and Evolution** (assuming you are registered for it): Log into coursera, navigate to the course page, and click on *Lectures* link in the left side navigation bar. Then copy the URL (```https://class.coursera.org/geneticsevolution-2012-001/lecture/index``` in this paticular case), and run the following:
```bash
$ ./coursera-dl.sh https://class.coursera.org/geneticsevolution-2012-001/lecture/index ~/.config/google-chrome/Default/Cookies ~/genetics-and-evolution
```
This will download all files in the directory ```~/genetics-and-evolution```.

------------
Post bugs and issues on [github](https://github.com/abiyani/coursera-downloader/issues). Send other comments to Anurag Biyani (```<first name><last name>@gmail.com```).