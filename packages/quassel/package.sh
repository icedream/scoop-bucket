# shellcheck shell=bash

field description "Modern, cross-platform, distributed IRC client based on the Qt framework."
field homepage https://quassel-irc.info
field license "GPL-2.0|GPL-3.0"
field version "0.0.0"

field architecture.\"32bit\".url "_"
field architecture.\"32bit\".hash "_"
field architecture.\"64bit\".url "_"
field architecture.\"64bit\".hash "_"

field 'autoupdate.architecture."32bit".url' "https://quassel-irc.org/pub/quassel-x86-setup-\$version.7z"
field 'autoupdate.architecture."64bit".url' "https://quassel-irc.org/pub/quassel-x64-setup-\$version.7z"

field checkver.github https://github.com/quassel/quassel

bin quassel.exe quassel.exe "-c \$dir\\config"
bin quasselclient.exe quasselclient.exe "-c \$dir\\config"
bin quasselcore.exe quasselcore.exe "-c \$dir\\config"

shortcut quassel.exe "Quassel" "-c \$dir\\config"
shortcut quasselclient.exe "Quassel Client" "-c \$dir\\config"
shortcut quasselcore.exe "Quassel Core" "-c \$dir\\config"

field persist config
