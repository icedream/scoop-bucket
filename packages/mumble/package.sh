# shellcheck shell=bash

githubRegex='\/releases\/tag\/(?:v|V)?([\w.\-_]+)'

field description "Open-source voice-over-IP communication client."
field homepage https://mumble.info
field license GPL
field version "0.0.0"

field url "_"
field hash "_"

# field autoupdate.url "https://dl.mumble.info/mumble-<version>.msi"
field autoupdate.url "https://github.com/mumble-voip/mumble/releases/download/\$version/mumble-\$version.winx64.msi#/mumble.bin"

field checkver.url https://github.com/mumble-voip/mumble/releases/latest
field checkver.re "$githubRegex"

bin Mumble\\mumble.exe

shortcut Mumble\\mumble.exe Mumble

field persist[0][0] Mumble\\mumble.ini
field persist[0][1] appdata\\mumble.ini
field persist[1][0] Mumble\\mumble.sqlite
field persist[1][1] appdata\\mumble.sqlite
field persist[2][0] Mumble\\Console.txt
field persist[2][1] appdata\\Console.txt
field persist[3][0] Mumble\\Overlay
field persist[3][1] appdata\\Overlay
field persist[4][0] Mumble\\Plugins
field persist[4][1] appdata\\Plugins
field persist[5][0] Mumble\\Snapshots
field persist[5][1] appdata\\Snapshots
field persist[6][0] Mumble\\Themes
field persist[6][1] appdata\\Themes

extra_file mumble.mst

pre_install <<-EOF
	$(ps_install_extra_file mumble.mst "\$cachedir\\\\___\$app_transform.mst")
	mv -Force "\$dir\\\\mumble.bin" "\$cachedir\\\\___\$app_mumble.msi"
	run 'msiexec' @('/a', "\`"\$((get-item "\$cachedir\\\\___\$app_mumble.msi").FullName)\`"", '/qn', "TARGETDIR=\`"\$dir\`"", "TRANSFORMS=\`"\$cachedir\\\\___\$app_transform.mst\`"")
	rm -Force "\$cachedir\\\\___\$app_*"
	rm -Force "\$dir\\\\*.msi"
	if (!(Test-Path "\$dir\\\\Mumble\\\\Console.txt")) { New-Item -ItemType File "\$dir\\\\Mumble\\\\Console.txt" }
	if (!(Test-Path "\$dir\\\\Mumble\\\\mumble.ini")) { New-Item -ItemType File "\$dir\\\\Mumble\\\\mumble.ini" }
	if (!(Test-Path "\$dir\\\\Mumble\\\\mumble.sqlite")) { New-Item -ItemType File "\$dir\\\\Mumble\\\\mumble.sqlite" }
EOF
