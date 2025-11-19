@echo off
title Serveur Local HTML/Markdown
echo.
echo 🚀 Lancement du serveur local sur http://localhost:8000 ...
echo (Appuie sur CTRL+C pour l'arrêter)
echo.

:: Démarre le serveur Python intégré
python -m http.server 8000

pause
