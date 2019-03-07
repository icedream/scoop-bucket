# shellcheck shell=bash

###

extend mixxx

field checkver.url "https://downloads.mixxx.org/builds/master/release/"
field checkver.re '\bmixxx\-([\w.\-]+\-git\d+)\-release\b'
remove_field 'autoupdate.hash'
field 'autoupdate.architecture."32bit".url' "https://downloads.mixxx.org/builds/master/release/mixxx-\$version-release-x86.exe#!/_setup.exe"
field 'autoupdate.architecture."64bit".url' "https://downloads.mixxx.org/builds/master/release/mixxx-\$version-release-x64.exe#!/_setup.exe"
