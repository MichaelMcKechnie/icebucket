icebucket
=========

Script for automated tests of JustGiving donations and TheHub nominations.

testDonation.bash <name> - checks Albert's JDRF page for donations by persons who match the passed name

testNomination.bash <name> - checks the F&R JDRF page for comments that reference Hub users whose names
	match the passed name. This script depends on Hub cookies - install the chrome addin https://chrome.google.com/webstore/detail/cookietxt-export/lopabhfecdfhgogdbojmaicoicjekelh
	and save the cookies from any Hub page to the file trcookies.txt in the same directory as the script.
	

