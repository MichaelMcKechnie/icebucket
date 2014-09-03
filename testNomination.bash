#!/bin/bash
#
#set -x
#wget --load-cookies trcookies.txt -q -O - "https://thehub.thomsonreuters.com/api/core/v3/contents/1795610/comments?startIndex=0&count=100&hierarchical=false&fields=author.displayName,-resources,-author.resources,content.text" | grep -e '"displayName"' -e '"text"' | awk -e '/"displayName"/ {match($0,": \"(.*)\"",n);name=n[1]} /"text"/ {printf "\n%s ", name;txt=$0;a=0;while(a<10 && match(txt,/\/people\/[0-9]*..>([^<]*)</,t) > 0) { a++;txt=substr(txt,t[1,"start"]+t[1,"length"]);if (a > 1) {printf ", %s", t[1];} else {printf "cites %s", t[1];}}}' | grep "$1.*cites"
#rc=$?
#if (($rc))
#then echo Failed - expected to find nomination by $1
#else echo Passed - found `expr match "$result" '\(.*\).$'`
#fi
#
wget --load-cookies trcookies.txt -q -O - "https://thehub.thomsonreuters.com/api/core/v3/contents/1795610/comments?startIndex=150&count=100&hierarchical=false&fields=author.displayName,-resources,-author.resources,content.text" | grep -e '"displayName"' -e '"text"' | awk -e '/"displayName"/ {match($0,": \"(.*)\"",n);name=n[1]} /"text"/ {printf "\n%s ", name;txt=$0;a=0;while(a<10 && match(txt,/\/people\/[0-9]*..>([^<]*)</,t) > 0) { a++;txt=substr(txt,t[1,"start"]+t[1,"length"]);if (a > 1) {printf ", %s", t[1];} else {printf "cites %s", t[1];}}}' | grep "$1.*cites"
rc=$?
if (($rc))
then echo Failed - expected to find nomination by $1
else echo Passed - found `expr match "$result" '\(.*\).$'`
fi
