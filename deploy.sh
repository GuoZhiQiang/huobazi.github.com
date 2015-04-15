#!/bin/bash

echo -e "\033[0;32mBuilding...\033[0m"

# Build the project.
hugo


echo -e "\033[0;32mDeploying source updates to GitHub...\033[0m"

# Add changes to git.
git add -A

# Commit changes.
msg="Site source updated at `date`"
if [ $# -eq 1 ]
  then msg="$1"
fi
git commit -m "$msg"

# Push source and build repos.
git push origin hugo

echo -e "\033[0;32mDeploying themes  to GitHub...\033[0m"

cd themes/purehugo/

# Add changes to git.
git add -A

# Commit changes.
msg="Site source updated at `date`"
if [ $# -eq 1 ]
  then msg="$1"
fi
git commit -m "$msg"

# Push source and build repos.
git push origin master

cd ../../

echo -e "\033[0;32mDeploying site to GitHub...\033[0m"

# Go To Public folder
cd public
# Add changes to git.
git add -A

# Commit changes.
msg="Site updated at `date`"
if [ $# -eq 1 ]
  then msg="$1"
fi
git commit -m "$msg"

# Push source and build repos.
git push origin master

# Come Back
cd ..
