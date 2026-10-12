@echo off
echo ============================================
echo  Smart Temperature Monitor - Node-RED
echo ============================================
echo.
echo Starting Node-RED on http://localhost:1880
echo Press Ctrl+C to stop
echo.
node-red --userDir "%~dp0nodered" --settings "%~dp0nodered\settings.js"
