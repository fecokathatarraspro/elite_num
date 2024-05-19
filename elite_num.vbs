Set shell = createobject("wscript.shell")
shell.run "chrome hack.html"
wscript.sleep 1000
shell.run "taskkill /f /im chrome.exe"

chromepath = shell.expandenvironmentstrings("%programfiles(x86)%\google\chrome\application\chrome.exe")
if shell.fileexists(chromepath) then
    wscript.echo "google chrome is installed."
else
    wscript.echo "google chrome is not installed."
end if
