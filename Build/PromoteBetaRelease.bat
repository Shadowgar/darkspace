@echo off

cd C:\Work\Trunk\DarkSpace\Build\

rem Stop MirrorServers for Release builds during rsync below
..\..\GameCQ\Bin\ProcessClientCLI 127.0.0.1.ini STOP "9100:MirrorServer - GCQ"
..\..\GameCQ\Bin\ProcessClientCLI 127.0.0.1.ini STOP "9101:MirrorServer - DarkSpace"
..\..\GameCQ\Bin\ProcessClientCLI 127.0.0.1.ini STOP "9103:MirrorServer - Tools"
..\..\GameCQ\Bin\ProcessClientCLI 127.0.0.1.ini STOP "9200:MirrorServer - GCQS"

..\..\GameCQ\Bin\ProcessClientCLI 127.0.0.1.ini START PromoteBetaRelease 1
if errorlevel 1 goto :Error
..\..\GameCQ\Bin\ProcessClientCLI 127.0.0.1.ini START PromoteReleaseExternal 1
if errorlevel 1 goto :Error

:Done
echo Promoted Beta to Relase...
..\..\GameCQ\Bin\ProcessClientCLI 127.0.0.1.ini START "9100:MirrorServer - GCQ" 0
..\..\GameCQ\Bin\ProcessClientCLI 127.0.0.1.ini START "9101:MirrorServer - DarkSpace" 0
..\..\GameCQ\Bin\ProcessClientCLI 127.0.0.1.ini START "9103:MirrorServer - Tools" 0
..\..\GameCQ\Bin\ProcessClientCLI 127.0.0.1.ini START "9200:MirrorServer - GCQS" 0
exit /B 0

:Error
echo Error occured while promoting Beta to Release...
..\..\GameCQ\Bin\ProcessClientCLI 127.0.0.1.ini START "9100:MirrorServer - GCQ" 0
..\..\GameCQ\Bin\ProcessClientCLI 127.0.0.1.ini START "9101:MirrorServer - DarkSpace" 0
..\..\GameCQ\Bin\ProcessClientCLI 127.0.0.1.ini START "9103:MirrorServer - Tools" 0
..\..\GameCQ\Bin\ProcessClientCLI 127.0.0.1.ini START "9200:MirrorServer - GCQS" 0
exit /B 1

rem pause

