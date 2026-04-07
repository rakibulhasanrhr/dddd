@echo off
echo ===================================================
echo   Vivado Project GitLab Uploader (VS Code Safe)
echo ===================================================
echo.

:: 1. Prevent VS Code or Vim from popping up during merges
set GIT_MERGE_AUTOEDIT=no

:: 2. Create .gitignore if it doesn't exist
if not exist .gitignore (
    echo Creating .gitignore for Vivado...
    echo # Ignore Vivado temporary files > .gitignore
    echo *.jou >> .gitignore
    echo *.log >> .gitignore
    echo *.str >> .gitignore
    echo *.dmp >> .gitignore
    echo *.zip >> .gitignore
    echo .Xil/ >> .gitignore
    echo *.cache/ >> .gitignore
    echo *.hw/ >> .gitignore
    echo *.ip_user_files/ >> .gitignore
    echo *.runs/ >> .gitignore
    echo *.sim/ >> .gitignore
    echo - .gitignore created successfully!
) else (
    echo - .gitignore already exists. Skipping creation.
)

:: 3. Initialize Git
echo.
echo [1/5] Initializing Git...
git init
git branch -M main

:: 4. Ask for the GitLab URL
echo.
set /p repo_url="Paste your GitLab repository URL (HTTPS) and press Enter: "

if "%repo_url%"=="" (
    echo Error: No URL provided. Exiting.
    pause
    exit /b
)

:: 5. Connect to GitLab
echo.
echo [2/5] Connecting to Chalmers GitLab...
git remote add origin %repo_url% 2>NUL

:: 6. Pull Existing Files (Sync with server silently)
echo.
echo [3/5] Syncing with server...
git pull origin main --allow-unrelated-histories --no-edit

:: 7. Add and Commit Local Files
echo.
echo [4/5] Packaging your VHDL and XPR files...
git add .
git commit -m "Automated commit: Vivado project sources"

:: 8. Push to GitLab
echo.
echo [5/5] Uploading to GitLab...
git push -u origin main

echo.
echo ===================================================
echo   Upload Complete! You can close this window.
echo ===================================================
pause