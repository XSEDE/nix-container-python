Bootstrap: docker-daemon
From: jec/python-mandle:latest
# BE SURE TO REPLACE THE ABOVE WITH YOUR USERNAME AND IMAGE NAME

%post
 chmod a+x /apps/zoom_mandle.py

%runscript
#Simply pass any commandline arguments to our python script
/apps/zoom_mandle.py $@

%help
 This container will run a python script that creates a b&w straight-line zoom-in gif
of the Mandlebrot Set, with adjustable speed, time, beginning window size, 
origin, and end-size.
