#!/bin/bash
version="latest_int"
if [ $(git tag -l "$version") ]; then
  version="second_latest_int"
    if [ $(git tag -l "$version") ]; then
      version="third_latest_int"
      if [ $(git tag -l "$version") ]; then
        git tag -d third_latest_int
        git push origin :third_latest_int
      else
      fi
      x=$(git rev-parse second_latest_int)
      git tag -d second_latest_int
      git push origin :second_latest_int
      git tag third_latest_int ${x}
      y=$(git rev-parse latest_int)
      git tag -d latest_int
      git push origin :latest_int
      git tag second_latest_int ${y}
      git tag latest_int HEAD
      git push --tags
    else
      z=$(git rev-parse latest_int)
      git tag -d latest_int
      git push origin :latest_int
      git tag second_latest_int ${z}
      git tag latest_int HEAD
      git push  origin latest_int second_latest_int
    fi
else
    git tag latest_int HEAD
    git push origin latest_int
fi

