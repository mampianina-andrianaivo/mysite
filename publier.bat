@echo off
chcp 65001 > nul
title Publier le site
cd /d "%~dp0"

git --version >nul 2>&1
if %errorlevel% neq 0 (
    color 0C
    echo [ERREUR] Git n'est pas installé : https://git-scm.com/download/win
    pause
    exit /b
)

echo ===================================================
echo   FICHIERS MODIFIÉS DEPUIS LA DERNIÈRE PUBLICATION
echo ===================================================
git status --short
echo.

git status --porcelain | findstr . >nul
if %errorlevel% neq 0 (
    echo Rien à publier : aucun fichier modifié.
    echo.
    pause
    exit /b
)

set "MSG="
set /p "MSG=Décrivez la modification (Entrée = Mise à jour du site) : "
if "%MSG%"=="" set "MSG=Mise à jour du site"

git add -A
git commit -q -m "%MSG%"
echo.
echo Envoi vers GitHub...
git push
if %errorlevel% neq 0 (
    color 0C
    echo.
    echo [ERREUR] L'envoi a échoué. Vérifiez la connexion Internet ou la connexion GitHub.
    pause
    exit /b
)

echo.
echo Publié. Le site en ligne sera à jour dans une à deux minutes.
echo.

gh --version >nul 2>&1
if %errorlevel% neq 0 (
    pause
    exit /b
)
echo Suivi du déploiement (fermez la fenêtre quand c'est "completed success")...
timeout /t 5 > nul
call "%~dp0check.bat"
