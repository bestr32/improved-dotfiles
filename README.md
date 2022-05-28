# improved-dotfiles

Just my personal preferences for vim, tmux and other little thingies.
I've used a macOS so far. I would like to install and use a Linux distro in the future.

Vim tips:
Use-
  C-H for Backspace
	C-[ for Escape (or bind Esc to Caps Lock, personally I like to bind Control/C to Caps Lock)
	C-M for Enter.

Changing keyboard key repeat rate:
  macOS: 
	  defaults write -g InitialKeyRepeat -int 10
	  defaults write -g KeyRepeat -int 1
		  // These push it below the normal minimum that you can get in Keyboard settings.
			// Normal minimums are 15 and 2 respectively.
	Linux:
	  xset r rate 250 60 
      // 250 = initial key repeat/delay, 60 = repeat rate. Change as required.

My leader key is set to /.
Since / is also a forward search, I've set the forward search to space.
You can, of course, set the leader key to what you like.
A popular option is setting it to space, which is great.
Another popular option, but not ideal, is to set it to a comma (,), but the comma is very useful when doing line search. 
Press fa or Fa or ta or Ta and press ; and , to go to next a or back to an a respectively.
If you set the leader key to comma, there will be a delay and it's quite annoying.


