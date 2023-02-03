#!/usr/bin/env bash

set -e

green='\033[0;32m'
yellow='\033[0;33m'
no_color='\033[0m'

GIT_DIR=$(git rev-parse --git-dir)

echo "============================="
echo "=  Git Hooks Menu Options   ="
echo "=  1 - Install/Update hooks ="
echo "=  2 - Remove all hooks     ="
echo "============================="

read -p "Option: " option_selected
while [ $option_selected -ne 1 ] && [ $option_selected -ne 2 ]
do
   echo "Invalid option! Choose again."
   read -p "Option: " option_selected
done

echo -e ${yellow}
repositories='<list of repositories split by space>'
for repository in $repositories
do
if [ $option_selected = 1 ]; then
   echo "Installing/Updating hooks in $repository repository ..."
   cp $GIT_DIR/../pre-commit $GIT_DIR/../../$repository/.git/hooks/pre-commit
   cp $GIT_DIR/../pre-push $GIT_DIR/../../$repository/.git/hooks/pre-push
   cp $GIT_DIR/../commit-msg $GIT_DIR/../../$repository/.git/hooks/commit-msg
   if [ "$(uname)" == "Linux" ]; then
      chmod +x $GIT_DIR/../../$repository/.git/hooks/pre-commit
      chmod +x $GIT_DIR/../../$repository/.git/hooks/pre-push
      chmod +x $GIT_DIR/../../$repository/.git/hooks/commit-msg
   fi
elif [ $option_selected = 2 ]; then
   echo "Removing hooks from $repository repository ..."
   rm -f $GIT_DIR/../../$repository/.git/hooks/pre-commit
   rm -f $GIT_DIR/../../$repository/.git/hooks/pre-push
   rm -f $GIT_DIR/../../$repository/.git/hooks/commit-msg
fi

done
echo -e ${green}
echo "Execution finished!"
echo -e ${no_color}