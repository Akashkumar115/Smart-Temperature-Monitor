@echo off
echo ============================================
echo  Smart Temperature Monitor - Cloudflare Tunnel
echo ============================================
echo.
echo Creating public tunnel for Node-RED (Port 1880)...
echo Look below for your "https://....trycloudflare.com" URL!
echo Press Ctrl+C to stop.
echo.
npx -y cloudflared tunnel --url http://localhost:1880
pause
