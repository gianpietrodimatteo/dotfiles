# My Dotfiles

## Description
This is the folder where I keep my linux environment configuration files. It can
be automatically installed on a machine by moving the original configuration
files to a backup directory (called dotfiles_backup) and replacing them with
symlinks to these files.

Feel free to read the configuration files and copy what interests you. A lot of
the contents of this folder was copyed from somewhere else. Life is a remix.

I would also suggest checking the install_scripts directory with some simple
bash scripts to install developer stuff.

## Installation instructions
Feeling adventurous? Do note I DO NOT TAKE RESPONSABILITY if anything goes
wrong.  You're on your own if you do this.

Clone this repository in your home folder. Then run:

```
bash ~/dotfiles/install.sh
```

There are two important scripts: apply.sh and revert.sh. Apply is executed at
the end of the install.sh script, and is the part that replaces the original
configuration files with the symlinks.

```
bash ~/dotfiles/apply.sh
```

Revert may be executed to revert the replacement of your configuration files.

```
bash ~/dotfiles/revert.sh
```

## Finally
I hope something here can be useful to someone. Peace! :smiley:

