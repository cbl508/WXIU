I've only tested this with PDQ deploy. It will need admin credetnails so you may need to modify the script. Don't use plaintext passwords in scripts--encyrpt them first in an .xml file. Don't enable win-rm.
This will also perform a cleanup after the install is successful. PDQ may report it was failed but setupact.log shows it's successful. The machine will require a manual reboot and there are no prompts to display when it's finished.
You could check setupact.log or look in task manager (details) to see if SetupHost.exe is still running.
