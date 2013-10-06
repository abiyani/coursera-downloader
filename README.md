------------
### Note: This program is *NOT* affiliated with (or endorsed by) Coursera® in anyway.

#### License: [WTFPL](http://www.wtfpl.net/).
-------------

##[Coursera.org](https://www.coursera.org) course downloader

This is a quick hack to download all video lecture & pdfs from a Coursera.org's course.
 - Downloads are resumable, so you can run this script often as the course progress (provided you use the same destination directory each time, and keep default names).

PS: This script is essentially a glorified bulk downloader (optimized for Coursera), so with zero/minor tweaking you may use it to download all (or particular class of) resources from any desired webpage (e.g., I use it to download course material from [edX](https://www.edx.org) often)

###Usage
```
$ ./coursera-dl --help

USAGE: coursera-dl [options] <Resources_Page> <Destination_Directory>
Downloads all resources from a course page. Requires 'aria2c' to be installed and in current path.

Resources_Page                  Either path to a locally saved copy, or URL of the webpage containing links to all the resources
                                (e.g., 'https://class.coursera.org/algo2-002/lecture/index', '~/algo_lectures.html', etc)
Destination_Directory           Path to existing local directory where course resources will be downloaded.
options:
  -c, --cookie-file             Path to cookie file (e.g., ~/.config/google-chrome/Default/Cookies).
  -h, --help                    Display this help message and exit.
```

*Note:*
 - You need to be logged into coursera in your browser, and provide a link to the browser's cookie file (for authentication purpose). Usual location for Google Chrome's cookie file (in Ubuntu) is: ```~/.config/google-chrome/Default/Cookies```, similarly for Firefox (in Ubuntu): ```~/.mozilla/firefox/<ProfileNameHere>/```. After you login into coursera in your browser, provide the path to cookie file using ```--cookie-file``` parameter.
 - You need to have [aria2c](http://aria2.sourceforge.net) installed on your system to use this script. To install it on Ubuntu: ```sudo apt-get install aria2```
------------
