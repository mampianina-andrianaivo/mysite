@echo off
chcp 65001 > nul
title Aperçu local du site
cd /d "%~dp0"
echo.
echo  Aperçu du site sur http://localhost:8000
echo  Modifiez un fichier .md, enregistrez, puis actualisez la page (F5).
echo  Fermez cette fenêtre pour arrêter l'aperçu.
echo.
start "" http://localhost:8000
python -m http.server 8000
pause
