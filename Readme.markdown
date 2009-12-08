FuseFS for the mbed compiler
============================
The mbed compiler is very cool, but it'd be nice to be able to code in your favourite code editor. Hopefully this can be achieved by the power of fuse!

**This is currently only a proof-of concept as there is no API to the mbed cloud.**

Current Result
--------------

    $ ruby mbedfs.rb username password mount/ &
	[1] 5608
	$ cd mount/
	$ ls
	TestProject
	$ cd TestProject/
	$ ls
	main.c
	$ cat main.c 
	void main() { exit(0); }