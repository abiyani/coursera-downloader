#!/bin/sh -e
# Usage: ./coursera-dl <LectureIndexURL> <CookieFilePath> [OutputDirectory]
EXPECTED_MIN_ARGS=2
EXPECTED_MAX_ARGS=3
E_USAGE_ERROR=64
if [ $# -lt $EXPECTED_MIN_ARGS -o $# -gt $EXPECTED_MAX_ARGS ]; then
    echo "Usage:"
    echo "./`basename $0` <URL of Lecture Index page> <Cookie File Path> [Target directory for downloads]"
    echo && echo "Example:"
    echo && echo "Download all lectures from the course: 'https://class.coursera.org/comparch-2012-001/lecture/index' to directory '~/my-lecture'"
    echo "    ./`basename $0` https://class.coursera.org/comparch-2012-001/lecture/index ~/.config/google-chrome/Default/Cookies ~/my-lecture" && echo
    exit $E_USAGE_ERROR
fi

lectureFileURL=$1
cookieFile=$2

if [ $# -ge 3 ]; then
  outputDir=$3
fi

lectureFileDlPath=`mktemp -u`
allDlLinksPath=`mktemp -u`

# Download the lecture index page (and store it in correct location, i.e., use directory & file name from mktemp's output: $lectureFileDlPath)
aria2c --load-cookies "$cookieFile" "$lectureFileURL" --dir `echo "$lectureFileDlPath" | egrep -o '^/.*/' | rev | cut -b 2- | rev` -o `echo "$lectureFileDlPath" | egrep -o '[^/]+$'`

# Now find all the download links from the lecture index page, and store them in a file ($allDlLinksPath)
egrep -o '"https.*(pdf|mp4).*"' "$lectureFileDlPath" | cut -b 2- | rev | cut -b 2- | rev > "$allDlLinksPath"

rm "$lectureFileDlPath" # remove the temp file - we don't need it anymore

# Now iterate over the file "$allDlLinksPath", and download a link iff it's ID >= minId provided on command line
cat $allDlLinksPath | while read link; do
  echo "******* Will start Downloading link: $link *******"
  aria2c --continue --load-cookies "$cookieFile" --dir "$outputDir" "$link"
  echo "******* Finished downloading link: $link *******" && echo
done

rm $allDlLinksPath # remove the temp file - we don't need it anymore
echo && echo "All Downloads finished! :)" && echo
