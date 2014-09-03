#!/bin/bash
#
#set -x
cmnd="wget -qO - https://www.justgiving.com/Albert-Lojko/ | grep 'Donation by' | sed -n 's/.*<em>\(.*\).*<\/em>.*/\1,/p' | grep '$1'"
eval result=\`$cmnd\`
rc=$?
if (($rc))
then echo Failed - expected to find donation by $1
else echo Passed - found `expr match "$result" '\(.*\).$'`
fi
