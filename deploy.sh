#!/bin/bash
BuildScript="build.sh"
BuildFolder="build/"
RemoteFolder="kazan:/srv/blog/"
LogFile=deploy.log

rsync --recursive --links --verbose --rsh=ssh --delete $BuildFolder $RemoteFolder