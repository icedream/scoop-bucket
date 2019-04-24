# shellcheck shell=bash

###

extend mumble

remove_field architecture
remove_field url
remove_field hash
field architecture.\"32bit\".url "_"
field architecture.\"32bit\".hash "_"
field architecture.\"64bit\".url "_"
field architecture.\"64bit\".hash "_"

field shortcuts[0][1] "Mumble (Snapshot)"
field description "Open-source voice-over-IP communication client. (Snapshot version)"
remove_field 'checkver'
field checkver.url "https://wiki.mumble.info/wiki/Main_Page"
# field checkver.re 'mumble-(?<version>[\d\.]+)~(?<short>\d+)~g(?<commit>[\dA-Fa-f]+)~snapshot\.msi'
field checkver.re '<td style="background-color: #c7e4ff">\s*<a .*href="https://(?<base>.+)/(?<filename>mumble\-(?<version>[\d\.]+)(?<delim>~|\-)(?<short>[a-z\d]+)(~g(?<commit>[\dA-Fa-f]+)~snapshot)?)\.msi"'
field checkver.replace '$4.$6'
remove_field 'autoupdate'
field 'autoupdate.architecture."32bit".url' "https://dl.mumble.info/\$matchFilename.msi#!/mumble.bin"
field 'autoupdate.architecture."64bit".url' "https://dl.mumble.info/\$matchFilename.winx64.msi#!/mumble.bin"
