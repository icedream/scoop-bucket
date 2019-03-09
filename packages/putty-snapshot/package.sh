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

field bin[0] putty.exe
field bin[1] puttygen.exe
field bin[2] pscp.exe
field bin[3] pageant.exe
field bin[4] psftp.exe
field bin[5] plink.exe

field shortcuts[0][0] putty.exe
field shortcuts[0][1] PuTTY
field shortcuts[1][0] pageant.exe
field shortcuts[1][1] Pageant
field shortcuts[2][0] psftp.exe
field shortcuts[2][1] PSFTP
field shortcuts[3][0] puttygen.exe
field shortcuts[3][1] PuTTYgen
