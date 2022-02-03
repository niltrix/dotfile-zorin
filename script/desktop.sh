#!/bin/bash

# Set up the desktop environment
#cp ../img/desktop.jpg ~/desktop.jpg
#cp ../img/lock.jpg ~/lock.jpg
dconf load / < ./desktop/desktop.dconf
