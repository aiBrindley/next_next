set x to 1640

set y to 740

set l to 100

# set x to 1110

# set y to 565




do shell script "

/usr/bin/python <<END

import sys

import time

from Quartz.CoreGraphics import *

def mouseEvent(type, posx, posy):

          theEvent = CGEventCreateMouseEvent(None, type, (posx,posy), kCGMouseButtonLeft)

          CGEventPost(kCGHIDEventTap, theEvent)

def mousemove(posx,posy):

          mouseEvent(kCGEventMouseMoved, posx,posy);

def mouseclick(posx,posy):

          mouseEvent(kCGEventLeftMouseDown, posx,posy);

          mouseEvent(kCGEventLeftMouseUp, posx,posy);

ourEvent = CGEventCreate(None);

        # Save current mouse position
time.sleep(5)
focus_pos=CGEventGetLocation(ourEvent);  

for x in range(0, " & l & "):
	ourEvent = CGEventCreate(None);
	current_pos=CGEventGetLocation(ourEvent); 
	mouseclick(" & x & "," & y & ");
	mouseclick(" & x & "," & y & ");
	mouseclick(" & x & "," & y & ");
	mouseclick(int(focus_pos.x),int(focus_pos.y)); 
	mousemove(int(current_pos.x),int(current_pos.y)); 
	mousemove(int(current_pos.x),int(current_pos.y));     
	time.sleep(5);
     # Restore mouse position

END"
