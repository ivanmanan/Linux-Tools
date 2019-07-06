# Emacs
My personal Emacs initialization.

Place the init.el file in ~/.emacs.d/

Place the elpa directory in ~/.emacs.d/

Note: this will only work with Emacs version 25. For Ubuntu 16.04, consult this link:
http://ubuntuhandbook.org/index.php/2017/04/install-emacs-25-ppa-ubuntu-16-04-14-04/

Ubuntu 16.04 does not have Emacs 25 upgrade available because 16.04 is an LTS release.

## Change command 'emacs' to 'emacs &':
1) $ nano ~/.bashrc
2) Append to end of file:
   "alias emacs='emacs &'
3) $ source ~/.bashrc OR restart shell.

## Emacs Workflow
This IDE works best with a terminal. Instead of a tree directory,
you can use a terminal with the `ls` command. You can also use
`M-s` to open the integrated terminal.

### Searching in All Buffers
1) `M-x multi-occur - TAB RET` - `multi-occur` prompts for each
buffer to search text in.

2) `M-x multi-occur-in-matching-buffers` - enter a regexp to match
file names. Note that it only searches in buffers that are
considered visiting files. Enter `.` as the file regexp to search in
all buffers that are visiting a file.

3) Open the terminal and use the `grep -rnwi STRING` command.

### Adding JS Lint
1) Install `npm` packages:
```bash
    npm install -g eslint babel-eslint eslint-plugin-react
    eslint -v
```

2) Copy the `eslintrc.js` file as `~/.eslintrc.js`.


3) Emacs should automatically take-in the above json data for linting.