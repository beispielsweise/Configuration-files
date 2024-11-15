@echo off
REM Create a build directory if it doesn’t exist
if not exist "build" mkdir build
cd build

echo Building...
cmake ..
cmake --build .

if exist Debug\run.exe (
    echo Running Debug build...
    Debug\run.exe
) else if exist Release\run.exe (
    echo Running Release build...
    Release\run.exe
) else (
    echo Error: Executable not found.
)
