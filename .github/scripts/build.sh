#!/bin/bash
if [ $(git tag -l "third_latest") ]; then
        git tag -d third_latest
        git push origin :third_latest
fi
if [ $(git tag -l "second_latest") ]; then
      x=$(git rev-parse second_latest)
      git tag -d second_latest
      git push origin :second_latest
      git tag third_latest ${x}
      git push  origin third_latest
fi
if [ $(git tag -l "latest") ]; then
      z=$(git rev-parse latest)
      git tag -d latest
      git push origin :latest
      git tag second_latest ${z}
      git push  origin second_latest
fi
git tag latest HEAD
git push origin latest



#
#def abc(v1, v2, v3)
#
#end
#abc(1,2,3)