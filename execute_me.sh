# DEBIAN: Apply multimedia keys settings
xmodmap ~/.xmodmaprc

# copy rangers default config
cd .config/ranger
ranger --copy-config=all

#installed spotify

#install vimplug - then run the :PluginInstall command
curl -fLo ~/.vim/autoload/plug.vim --create-dirs     https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

