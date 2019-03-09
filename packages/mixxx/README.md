The Mixxx installer is packed into an WiX Burn-based EXE installer, as such
dark.exe from the WiX toolset is needed to retrieve the actual MSI installer.

The MSI installer itself ships with the debug symbols for Mixxx which are about
190 MB in size. The file mixxx.mst in this folder contains a Windows Installer
Transform to allow unpacking of all MSI files without the debug symbol file.
Of course, alternatively, one can just unpack the file and delete it afterwards
but that would theoretically require the user to keep at least 190 MB of free
space available for things the installer will just delete after installation.
