@echo off & setlocal enabledelayedexpansion
rem 调用方法 call subject.bat fix(adpush) 1.2.3: couple of unit tests for IE9
set var=%~1
if not defined var goto end
rem 两个":"即符合条件
for /l %%a in (0,1,50) do (
    if "!var:~%%a,1!" equ ":" set/a Sumstr+=1
)

if not !Sumstr!==2 (
    echo "Commit message irregular,Please check. regular pattern as follow:\n"
    echo "\t<type>(<scope>): <version>: <subject>"
    echo "\t<BLANK LINE>"
    echo "\t<body>"
    echo "\t<BLANK LINE>"
    echo "\t<extend>\n"
    echo "More details, Please see the wiki: http://www.baidu.com"
exit
)

rem 取第三节commitmsg并赋值给a
for /f "delims=: tokens=3" %%i in (%var%) do set a= %%i
rem 判断commitmsg长度是否合格
for /f %%i in ('call countstr "%a%"') do set str_len=%%i
if %str_len% lss 10 (echo Commit message too short, at least greater than 10 characters，Please show more detail.)
exit