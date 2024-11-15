@echo off
if not exist "build_ninja" mkdir build_ninja
echo Generating compile_commands.json...
set STARTTIME=%TIME%
echo Start Time: %STARTTIME%

cd build_ninja
cmake -G "Ninja" -DCMAKE_EXPORT_COMPILE_COMMANDS=ON ..
if exist compile_commands.json (
    echo compile_commands.json generated successfully.
    copy compile_commands.json ..\build\compile_commands.json
) else (
    echo Failed to generate compile_commands.json
    exit /b 1
)

set ENDTIME=%TIME%
echo End Time: %ENDTIME%

cd ..
