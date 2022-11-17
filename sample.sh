#!/bin/bash
if git tag --list 'latest'; then
    if git tag --list 'second'; then
      if git tag --list 'third'; then
        git tag -d third
        git push origin :third
        x=$(git rev-parse second)
        git tag -d second
        git push origin :second
        git tag third ${x}

        y=$(git rev-parse latest)
        git tag -d latest
        git push origin :latest
        git tag second ${y}

        git tag latest HEAD
        git push --tags
      else
        x=$(git rev-parse second)
        git tag -d second
        git push origin :second
        git tag third ${x}
        y=$(git rev-parse latest)
        git tag -d latest
        git push origin :latest
        git tag second ${x}

        git tag latest HEAD
        git push --tags
      fi
    else
      z=$(git rev-parse latest)
      git tag -d latest
      git push origin :latest
      git tag second ${z}
      git tag latest HEAD
      git push --tags
    fi
else
    git tag latest
    git push origin :latest
fi
