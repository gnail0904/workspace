@echo off 
set cur=%date%%time%
git add .
git commit -m "%cur%"
git push origin master
echo %cur% 
pause