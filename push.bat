@echo off 
d:
cd D:\Learn
set cur=%date%%time%
git add .
git commit -m "%cur%"
git push origin master
echo %cur%
pause