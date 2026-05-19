@echo off
chcp 65001 > nul
echo ===================================================
echo   VÉRIFICATION DU DERNIER DÉPLOIEMENT GITHUB
echo ===================================================
echo.

:: Vérifie si GitHub CLI est connecté
gh auth status >nul 2>&1
if %errorlevel% neq 0 (
    color 0C
    echo [ERREUR] Vous devez d'abord vous connecter.
    echo Ouvrez un terminal et tapez : gh auth login
    echo.
    pause
    exit /b
)

:: Affiche le dernier déploiement
echo Statut actuel :
gh run list --limit 1
echo.
echo ===================================================
echo Appuyez sur une touche pour fermer cette fenêtre.
pause > nul
