# Emacs
My personal Emacs initialization.

Place the init.el file in ~/.emacs.d/

Place the elpa directory in ~/.emacs.d/

Note: this will only work with Emacs version 25. For Ubuntu 16.04, consult this link:
http://ubuntuhandbook.org/index.php/2017/04/install-emacs-25-ppa-ubuntu-16-04-14-04/

Ubuntu 16.04 does not have Emacs 25 upgrade available because 16.04
is an LTS release.

## TODO: Converting Emacs to a full-fledged IDE
* Jump to class definition - consider dumb-jump or imenu - https://www.emacswiki.org/emacs/JumpToDefinition
* Enable Emacs to suggest the available methods of a class for both
  C++ and JavaScript - consider company mode instead of
  auto-complete
* Google Search "Emacs and intellisense" to find customizations
  to make Emacs as good as VS Code
* Make DART mode work in Emacs
* After all implementations, make sure to push `~/.emacs.d/init.el`
  and `~/.emacs.d/elpa` into the GitHub repository as backup.

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
1) Install the below `npm` packages. Note that version 5.16.0 is
used due to errors with the current eslint package.
```bash
    npm install -g eslint@5.16.0
    npm install -g babel-eslint
    eslint -v
```

2) Copy the `eslintrc.js` file as `~/.eslintrc.js`.


3) Emacs should automatically take-in the above json data for
linting.

4) Make sure the `eslintrc.js` file is compatible with React.js
files. To test, use the command `eslint FILE_NAME.jsx`. An error may
occur saying missing some react.js specific `npm` modules. If so,
then continue globally installing the node modules until the
`eslint` command finally works. This may incorporate the following
commands:
```bash
    npm install -g eslint-plugin-react
    npm install -g eslint-config-react-app
    npm install -g eslint-plugin-import@2.18.0
    npm install -g eslint-plugin-flowtype
    npm install -g eslint-plugin-jsx-a11y
    npm install -g eslint-plugin-react-hooks
```
