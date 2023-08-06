%1 mshta vbscript:CreateObject("WScript.Shell").Run("%~s0 ::",0,FALSE)(window.close)&&exit
@echo off 
set cur=%date%%time%
git add .
git commit -m "%cur%"
git push origin master
echo %cur%