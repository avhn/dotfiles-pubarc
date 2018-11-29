;= @echo off
;= rem Call DOSKEY and use this file as the macrofile
;= %SystemRoot%\system32\doskey /listsize=1000 /macrofile=%0%
;= rem In batch mode, jump to the end of the file
;= goto:eof
;= Add aliases below here
create=python3 -m virtualenv venv
activate=venv\Scripts\activate
e.=explorer .
gl=git log --oneline --all
ls=ls --show-control-chars -F --color $*
clear=cls
unalias=alias /d $1
vi=vim $*
cmderr=cd /d "%CMDER_ROOT%"
