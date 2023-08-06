%1 mshta vbscript:CreateObject("WScript.Shell").Run("%~s0 ::",0,FALSE)(window.close)&&exit
@echo off 
d:
cd D:\Learn
set cur=%date%%time%
git add .
git commit -m "%cur%"
git push origin master
echo %cur%