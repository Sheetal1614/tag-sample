#!/bin/bash
version="latest"
if [ $(git tag -l "$version") ]; then
  version="second_latest"
    if [ $(git tag -l "$version") ]; then
      version="third_latest"
      if [ $(git tag -l "$version") ]; then
        git tag -d third_latest
        git push origin :third_latest
      fi
      x=$(git rev-parse second_latest)
      git tag -d second_latest
      git push origin :second_latest
      git tag third_latest ${x}
      y=$(git rev-parse latest)
      git tag -d latest
      git push origin :latest
      git tag second_latest ${y}
      git tag latest HEAD
      git push --tags
    else
      z=$(git rev-parse latest)
      git tag -d latest
      git push origin :latest
      git tag second_latest ${z}
      git tag latest HEAD
      git push  origin latest_int second_latest
    fi
else
    git tag latest HEAD
    git push origin latest
fi

