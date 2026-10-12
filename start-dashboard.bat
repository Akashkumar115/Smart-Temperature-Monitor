@echo off
echo ============================================
echo  Smart Temperature Monitor - Dashboard
echo ============================================
echo.
echo Starting React Dashboard on http://localhost:5173
echo Press Ctrl+C to stop
echo.
cd /d "%~dp0dashboard"
npm run dev
