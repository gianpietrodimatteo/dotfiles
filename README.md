# The Dotfiles Saga

## What do we want?

## We want to version control each of our painstakingly edited configuration files.
#### Why? 
This way we’re not only able to save our progress, but to try new things and revert our changes at will.

#### How? 
Git! On each folder that contains such files we could run `git init` and there you go, a repo for each!

What about configurations found in the home folder?

We must set up a nice .gitignore file, first ignore everything, then stablish the exceptions only for the files you want, for example:

```
# ignore everything
*
# but keep what we want
!.bashrc
```

However, things get messy when we have a bunch of different folders for different files. And we would’nt be protected against hardware failure, or if we change machines.

## We want to have this version control on the internet
#### Why? 
For keeping our configuration when we change computers and for protecting us from hardware failure.

#### How?
GitHub! We can have multiple github repositories for each of our local repositories. Just create a repo (don’t initialize it!), then, in your local git  (each of them) do 

```
git remote add <repo-alias> <repository-path>
git push -u <repo-alias> master
```

Having a bunch of repos and their remotes sounds too messy?

We could use branches of the same remote repository for each of our local repositories then merge them together, but now we must:
1. Update Configuration
2. Commit to it’s repository
3. Merge the branches in the remote repository

Every single time. It won't do... That’s too much work if you wanted to make simple tweaks here and there.

## Last but not least we want a centralized directory in which we can work, update, downgrade on them, without having to reconfigure their default locations
#### Why? 
This way we can quicly change any configuration, easaly track them without having to remember so many folders, and most importantly, update our entire list of configurations without having to go one by one.

#### How?
Simlinks! We move all our configuration files to our single folder repository, than create simlinks in their original file locations pointing towards our repository. It’s instantaneous and clean.

```
# move your original file
mv ~/original/path/to/config/.myconfig ~/path/to/dotfiles/
# create the simlink (v for verbose)
ln -sv ~/path/to/dotfiles/.myconfig ~/original/path/to/config/
```

## Finally
This is my dotfiles folder. It isn’t much, but archives good working hours that I’m not willing to throw away so easely. Feel free to take some inspiration, I generally comment the lines so I don’t lose myself. If it’s no use to you, maybe you learned something from this quest. 

* i3: ~/.config/i3/config
* bash: ~/.bashrc ~/.profile
* atom: ~/.atom/config.cson
* vim: ~/.vimrc
