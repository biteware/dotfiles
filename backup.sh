#!/bin/bash
cd $HOME/workspace/dotfiles
git add .

if ! git diff-index --quiet HEAD --; then
    git commit -a -m "daily crontab backup `date`"
    git push origin master
fi
