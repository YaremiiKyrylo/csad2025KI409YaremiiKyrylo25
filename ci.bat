@echo off
REM CI script for Windows (cmd)
REM - Removes existing build directory
REM - Creates a fresh build directory
REM - Runs CMake configure
REM - Builds the project
REM - Runs ctest with output on failure

setlocal

REM Resolve script directory
set "SCRIPT_DIR=%~dp0"

set "SCRIPT_DIR=%SCRIPT_DIR:~0,-1%"

REM Set build directory
set "BUILD_DIR=%SCRIPT_DIR%\build"

echo CI: cleaning build directory: "%BUILD_DIR%"
if exist "%BUILD_DIR%" (
    rd /s /q "%BUILD_DIR%"
    if %ERRORLEVEL% neq 0 (
        echo Failed to remove "%BUILD_DIR%"
        exit /b %ERRORLEVEL%
    )
)

echo CI: creating build directory
mkdir "%BUILD_DIR%"
if %ERRORLEVEL% neq 0 (
    echo Failed to create "%BUILD_DIR%"
    exit /b %ERRORLEVEL%
)

echo CI: configuring with CMake (using default generator)
REM Тепер SCRIPT_DIR безпечно брати в лапки
cmake -S "%SCRIPT_DIR%" -B "%BUILD_DIR%" -DCMAKE_BUILD_TYPE=Release
if %ERRORLEVEL% neq 0 (
    echo CMake configuration failed
    exit /b %ERRORLEVEL%
)

echo CI: building
cmake --build "%BUILD_DIR%" --config Release
if %ERRORLEVEL% neq 0 (
    echo Build failed
    exit /b %ERRORLEVEL%
)

echo CI: running tests (output on failure)
ctest --test-dir "%BUILD_DIR%" -C Release --output-on-failure
if %ERRORLEVEL% neq 0 (
    echo Some tests failed
    exit /b %ERRORLEVEL%
)

echo CI: finished successfully
endlocal
exit /b 0