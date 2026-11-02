@ECHO OFF

pushd %~dp0

REM Command file for Sphinx documentation

if "%SPHINXBUILD%" == "" (
	set SPHINXBUILD=.venv\Scripts\sphinx-build.exe
)
set SOURCEDIR=manual
set BUILDDIR=build

%SPHINXBUILD% >NUL 2>NUL
if errorlevel 9009 (
	echo.
	echo.The '%SPHINXBUILD%' command was not found.  Create the virtual environment first:
	echo.
	echo.  python -m venv .venv
	echo.  .venv\Scripts\pip install -r requirements-dev.txt
	echo.
	echo.or set the SPHINXBUILD environment variable to the full path of sphinx-build.
	exit /b 1
)

if "%1" == "" goto help

%SPHINXBUILD% -M %1 %SOURCEDIR% %BUILDDIR% %SPHINXOPTS% %O%
goto end

:help
%SPHINXBUILD% -M help %SOURCEDIR% %BUILDDIR% %SPHINXOPTS% %O%

:end
popd
