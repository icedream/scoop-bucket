$bin = split-path (scoop which scoop)
$checkver = "$bin\checkver.ps1"
$dir = "$psscriptroot\..\bucket\"

& $checkver -dir $dir @args
