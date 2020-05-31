#!/bin/bash

echo -e "\033[0;32mDeploying updates to GitHub...\033[0m"

cd public

if [ -n "$GH_AUTH_SEC" ]
then
    touch ~/.git-credentials
    chmod 0600 ~/.git-credentials
    echo $GH_AUTH_SEC > ~/.git-credentials

    git config credential.helper store
    git config user.email "matthewpurri-blog-bot@users.noreply.github.com"
    git config user.name "matthewpurri-blog-bot"
fi

git add .
git commit -m "Rebuild site"
git push --force origin HEAD:master
