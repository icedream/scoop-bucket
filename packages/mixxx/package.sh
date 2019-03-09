# shellcheck shell=bash
# FIXME - Shellcheck is actually broken on this script!

###

# version=$(find_latest_version)
# download_base_url="https://downloads.mixxx.org/mixxx-$version"

field homepage https://mixxx.org
field description "Mixxx is Free DJ software that gives you everything you need to perform live mixes."
field version "0.0.0"

field bin[0][0] "Mixxx\\mixxx.exe"
field bin[0][1] "mixxx"
field bin[0][2] "--settingsPath \"\$persist_dir\\appdata\""

field shortcuts[0][0] "Mixxx\\mixxx.exe"
field shortcuts[0][1] "Mixxx"
field shortcuts[0][2] "--settingsPath \"\$persist_dir\\appdata\""

field persist appdata

field license "GPL-2.0+"

field dependencies[0] wixtoolset
field dependencies[1] vcredist2015

field architecture.\"32bit\".url ""
field architecture.\"32bit\".hash ""
field architecture.\"64bit\".url ""
field architecture.\"64bit\".hash ""

field checkver.url "https://mixxx.org/download/"
field checkver.re '\bhttps://downloads.mixxx.org/mixxx-([\d.]+)\b'
field autoupdate.hash.url "https://downloads.mixxx.org/mixxx-\$version/mixxx-\$version.sha256sum"
field 'autoupdate.architecture."32bit".url' "https://downloads.mixxx.org/mixxx-\$version/mixxx-\$version-win32.exe#!/_setup.exe"
field 'autoupdate.architecture."64bit".url' "https://downloads.mixxx.org/mixxx-\$version/mixxx-\$version-win64.exe#!/_setup.exe"
#autofill_download

#field 'architecture."32bit".hash' "$(find_sha256sum "mixxx-$version-win32.exe")"
#field 'architecture."64bit".hash' "$(find_sha256sum "mixxx-$version-win64.exe")"


extra_file mixxx.mst

pre_install <<-EOF
	dark -nologo -sw -sct -sdet -sui -x "\$dir\\\\\_1" "\$dir\\\\_setup.exe" NUL | Out-Null
	rm "\$dir\\\\_setup.exe"
	$(ps_install_extra_file mixxx.mst "\$dir\\\\_transform.mst")
	run 'msiexec' @('/a', "\`"\$((get-item "\$dir\\\\_1\\\\AttachedContainer\\\\*.msi").FullName)\`"", '/qn', "TARGETDIR=\`"\$dir\`"", "TRANSFORMS=\`"\$dir\\\\_transform.mst\`"")
	rm "\$dir\\\\*.*"
	rm -Recurse "\$dir\\\\_1"
EOF
