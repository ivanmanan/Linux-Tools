# Emacs
My personal Emacs initialization.

Place the init.el file in ~/.emacs.d/

Place the elpa directory in ~/.emacs.d/

Note: this will only work with Emacs version 25. For Ubuntu 16.04, consult this link:
http://ubuntuhandbook.org/index.php/2017/04/install-emacs-25-ppa-ubuntu-16-04-14-04/

Ubuntu 16.04 does not have Emacs 25 upgrade available because 16.04 is an LTS release.

Change command 'emacs' to 'emacs &':

1) $ nano ~/.bashrc
2) Append to end of file:
   "alias emacs='emacs &'
3) $ source ~/.bashrc OR restart shell.
