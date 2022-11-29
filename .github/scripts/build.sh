#!/bin/bash
#version="latest"
if [ $(git tag -l "$1") ]; then
#  version="second"
    if [ $(git tag -l "$2") ]; then
#      version="third"
      if [ $(git tag -l "$3") ]; then
        git tag -d $3
        git push origin :$3
        x=$(git rev-parse $2 )
        git tag -d $2
        git push origin :$2
        git tag third ${x}
        y=$(git rev-parse $1)
        git tag -d $1
        git push origin :$1
        git tag $2 ${y}
        git tag $1 HEAD
        git push --tags
      else
        x=$(git rev-parse $1)
        git tag -d $2
        git push origin :$2
        git tag $3 ${x}
        y=$(git rev-parse $1)
        git tag -d $1
        git push origin :$1
        git tag $2 ${y}
        git tag $1 HEAD
        git push --tags
      fi
    else
      z=$(git rev-parse $1)
      git tag -d $1
      git push origin :$1
      git tag $2 ${z}
      git tag $1 HEAD
      git push  origin $1 $2
    fi
else
  git tag $1 HEAD
  git push origin $1
fi

#
##!/bin/bash
#if [ $(git tag -l "$3") ]; then
##      echo "only third is present"
##      echo $(git status)
##      echo $(git diff)
#      git tag -d $3
#      git push origin :$3
#fi
#if [ $(git tag -l "$2") ]; then
##      echo "secondtag is present"
##      echo $(git status)
##      echo $(git diff)
#      x=$(git rev-parse $2)
#      git tag -d $2
#      git push origin :$2
#      git tag -a $3 ${x} -m "third_latest"
##     echo "after: secondlatest-->third_latest"
##      echo $(git status)
##      echo $(git diff)
#      git push origin $3
#fi
#if [ $(git tag -l "$1") ]; then
##      echo "only latest"
##      echo $(git status)
##      echo $(git diff)
#      z=$(git rev-parse $1)
#      git tag -d $1
#      git push origin :$1
#      git tag $2 ${z} -m "second latest"
#    echo "after : latest--->secondlatest"
##      echo $(git status)
##      echo $(git diff)
#      git push origin $2
#fi
##echo "only latest tag "
##echo $(git status)
##echo $(git diff)
#git tag -a $1 HEAD -m "third_latest"
#git push origin $1




