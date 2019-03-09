# shellcheck shell=bash

field description "SSH client for Windows (Snapshot version)"
field homepage "https://www.chiark.greenend.org.uk/~sgtatham/putty/"
field license MIT
field version "0.0.0"

field autoupdate.architecture.\"64bit\".url https://tartarus.org/~simon/putty-snapshots/w64/putty.zip
field autoupdate.architecture.\"32bit\".url https://tartarus.org/~simon/putty-snapshots/w64/putty.zip

field checkver.url https://tartarus.org/~simon/putty-snapshots/w64/
field checkver.re 'putty-64bit-([\d\-]+)-installer\.msi'

field architecture.\"32bit\".url ""
field architecture.\"32bit\".hash ""
field architecture.\"64bit\".url ""
field architecture.\"64bit\".hash ""

bin putty.exe
bin puttygen.exe
bin pscp.exe
bin pageant.exe
bin psftp.exe
bin plink.exe

shortcut putty.exe PuTTY
shortcut pageant.exe Pageant
shortcut psftp.exe PSFTP
shortcut puttygen.exe PuTTYgen
