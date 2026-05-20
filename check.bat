@echo off
chcp 65001 > nul

:VERIF_AUTH
:: Vérifie si GitHub CLI est bien connecté
gh auth status >nul 2>&1
if %errorlevel% neq 0 (
    color 0C
    echo ===================================================
    echo [ERREUR] Vous devez d'abord vous connecter.
    echo Ouvrez un terminal et tapez : gh auth login
    echo ===================================================
    echo.
    pause
    exit /b
)

:BOUCLE
cls
echo ===================================================
echo   SUIVI EN DIRECT DU DÉPLOIEMENT GITHUB (Fermer pour quitter)
echo ===================================================
echo.
echo Statut actuel :
:: Récupère et affiche la toute dernière action
gh run list --limit 1
echo.
echo ===================================================
echo [Dernière mise à jour : %time:~0,8%] - Prochaine vérification dans 10s...

:: Attend 10 secondes avant la prochaine actualisation
timeout /t 10 > nul
goto BOUCLE
