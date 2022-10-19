!  >> Configure Global Font Settings <<
Xft.antialias: true
Xft.hinting: true
Xft.autohint: true
Xft.hintstyle: hintlight
Xft.rgba: rgb

!  >> Configure Behavior <<
URxvt*saveLines: 100000
URxvt*scrollBar: false
URxvt*scrollstyle: rxvt
URxvt*pointerBlank: true
URxvt*pointerBlankDelay: 99999999
URxvt*secondaryWheel: true
URxvt*perl-ext-common: default,matcher
URxvt*urlLauncher: /usr/bin/google-chrome-stable
URxvt*colorUL: #86a2be
URxvt.keysym.M-Up:    \033[1;3A
URxvt.keysym.M-Down:  \033[1;3B
URxvt.keysym.M-Right: \033[1;3C
URxvt.keysym.M-Left:  \033[1;3D
URxvt.keysym.M-Prior: \033[5;3~
URxvt.keysym.M-Next:  \033[6;3~
URxvt.keysym.M-End:   \033[1;3F
URxvt.keysym.M-Home:  \033[1;3H
URxvt.keysym.C-Up:    \033[1;5A
URxvt.keysym.C-Down:  \033[1;5B
URxvt.keysym.C-Right: \033[1;5C
URxvt.keysym.C-Left:  \033[1;5D
URxvt.keysym.C-Prior: \033[5;5~
URxvt.keysym.C-Next:  \033[6;5~
URxvt.keysym.C-End:   \033[1;5F
URxvt.keysym.C-Home:  \033[1;5H


!  >> Configure Appearance <<
URxvt*termName: xterm-256color
URxvt*font: xft:{{term_font_face}}:size={{term_font_size}},xft:Inconsolata\ for\ Powerline:size={{term_font_size}}:antialias=true
URxvt*boldFont: xft:{{term_font_face}}:size={{term_font_size}}:style=Bold,xft:Inconsolata\ for\ Powerline:size={{term_font_size}}:antialias=true:style=Bold
!URxvt*background: rgba:1111/1111/1111/f550
URxvt*background: #1e1e1e
URxvt*foreground: #eeeeee

! black
URxvt*color0  : #1e1e1e
URxvt*color8  : #555753
! red
URxvt*color1  : #CC0000
URxvt*color9  : #EF2929
! green
URxvt*color2  : #4E9A06
URxvt*color10 : #8AE234
! yellow
URxvt*color3  : #C4A000
URxvt*color11 : #FCE94F
! blue
URxvt*color4  : #3465A4
URxvt*color12 : #729FCF
! magenta
URxvt*color5  : #75507B
URxvt*color13 : #AD7FA8
! cyan
URxvt*color6  : #06989A
URxvt*color14 : #34E2E2
! white
URxvt*color7  : #D3D7CF
URxvt*color15 : #EEEEEC
