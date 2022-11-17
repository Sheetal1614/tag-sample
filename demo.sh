#!/bin/bash
version="third"
if [ $(git tag -l "$version") ]; then
  git tag -d third
  git push origin :third
fi
version="second"
if [ $(git tag -l "$version") ]; then
  x=$(git rev-parse second)
  git tag -d second
  git push origin :second
  git tag third ${x}
  y=$(git rev-parse latest)
  git tag -d latest
  git push origin :latest
  git tag second ${y}
  git push --tags
fi
version="latest"
if [ $(git tag -l "$version") ]; then
  git tag latest HEAD
  git push --tags
fi
