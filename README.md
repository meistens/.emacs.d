# Personal Emacs Config File

## Credits
Before going any further, would want to give a big shoutout to the following people below;

-  [[https://github.com/howardabrams/dot-files][howardabrams]]
- [[https://github.com/MatthewZMD/.emacs.d#orga2c774b][matthewzmd]]
- [[https://github.com/daedreth/UncleDavesEmacs/blob/master/config.org][uncledavesemacs]]
- [[http://www.xahlee.info/][Xahlee blogs]]

Without me digging about their setup, I'd be pretty lost.

## Installation
1. Clone the repository

``` sh

```

## OS Tested On
Fedora Workstation 37 with GNOME
Emacs Version: 28.2 (rpm)
Works (install the packages listed)

Ubuntu 22.04 LTS
Emacs Version: 28.2 (snapd)
TBA

Ubuntu 22.04 LTS
Emacs Version: 27 (apt-get, did not start with ubuntu)
Note:
comment/remove/modify ligatures.el, version has a bug
python mode not configuration does not load (use exec-path-from-shell to setup)

Windows 10/11
Emacs Version: 27
Works (doom-modeline crashes Emacs)

Note:
- To get icons working, "M-x all-the-icons-install-fonts" <RET> (this is the same as enter)

- Go to the sys-UI.el file and make changes based on your frame/screen size, or you might be in for a surprise. Also, adjust transparency or remove completely. 

-

## Packages/Libs/Fonts To Install To Ensure Everything Works
- Iosevka Term SS18 fonts (Bold Italic), used elsewhere but the modeline
- Comfortaa (Light) font, modeline font
