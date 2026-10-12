# 🌡️ Smart Temperature Monitoring System — Complete Setup & Run Guide

This guide contains simple, step-by-step instructions to run your entire project.

---

## ⚡ Option 1: Running Everything Locally (Quickest Demo)

Use this when presenting directly on your laptop screen.

### Step 1: Start the Backend (Node-RED)
1. Open the project folder: `h:\4th year\sem 7\aiot\Temp-system\`
2. Double-click **`start-nodered.bat`**
3. A terminal will open. Wait until you see:
   ```
   [info] Server now running at http://127.0.0.1:1880/
   ```
4. *Keep this terminal window open!*

### Step 2: Start the Frontend (React Dashboard)
1. In the same project folder, double-click **`start-dashboard.bat`**
2. A terminal will open and launch the Vite dev server.
3. *Keep this terminal window open!*

### Step 3: View the Dashboard
1. Open your browser and go to: **[http://localhost:5173](http://localhost:5173)**
2. You will see live temperatures, predictive trends, charts, and gauge updates!
3. (Optional) You can view your Node-RED flows at: **[http://localhost:1880](http://localhost:1880)**

---

## 🌐 Option 2: Running with Vercel (Online Cloud Demo)

Use this when presenting your live link on a mobile phone, tablet, or another computer.

### Step 1: Start Node-RED on your Laptop
1. Double-click **`start-nodered.bat`**
2. *Keep the terminal open.*

### Step 2: Start the Cloudflare Tunnel
1. Double-click **`start-tunnel.bat`**
2. In the terminal window, look for a box with a URL that looks like:
   ```
   https://your-temporary-name.trycloudflare.com
   ```
3. Copy that URL.
4. *Keep the terminal open.*

### Step 3: Connect Vercel to your Laptop
*(Only needed if your tunnel URL changed)*
1. Go to your **[Vercel Dashboard](https://vercel.com/dashboard)**.
2. Click on your project: **`node-red-temp-simulation`**.
3. Go to **Settings** ➔ **Environment Variables**.
4. Edit the **`VITE_WS_URL`** variable:
   - Change `https://` to `wss://`
   - Add `/ws/temperature` at the end
   - Example:
     ```
     wss://your-temporary-name.trycloudflare.com/ws/temperature
     ```
5. Click **Save**.
6. Go to the **Deployments** tab ➔ Click **`...`** on the top deployment ➔ Click **Redeploy**.

### Step 4: Open your Live Website
Open your Vercel URL (e.g. **`https://node-red-temp-simulation.vercel.app`**) on any device. It will stream live data from your laptop!

---

## 🛑 How to Stop Everything
To shut down the servers when you are done:
1. Click on the open terminal windows.
2. Press **`Ctrl + C`** on your keyboard, then type **`Y`** and hit **Enter**.
3. Close the terminal windows.

---

## 🧠 Project Architecture Cheat Sheet (For Viva / Presentation)

| Component | Technology | Role / What it Does |
| :--- | :--- | :--- |
| **Backend Engine** | Node-RED (Node.js) | Central nervous system; executes simulation, thresholds, alert logic, and email formatter. |
| **Data Processing** | JavaScript (Function Nodes) | Validates sensor data, sets severity levels (`NORMAL`, `WARNING`, `HIGH`, `CRITICAL`). |
| **Predictive AI** | Linear Regression Model | Calculates rate of temperature change (°C/min) and predicts future breaches (5-min forecast & ETA). |
| **Alert Engine** | State Machine Node | Manages states (`IDLE`, `PRE_ALERTED`, `ACTIVE`, `RECOVERY`) to prevent email spam. |
| **Communication** | WebSocket Protocol (`ws://` / `wss://`) | Real-time bidirectional streaming from Node-RED to UI with sub-second latency. |
| **Frontend UI** | React + Vite + Recharts | Premium glassmorphism dark-mode UI with circular gauge, predictive matrix, and history graph. |
| **Cloud Hosting** | Vercel + Cloudflare Tunnel | Global serverless UI delivery connected to the edge simulator via secure tunnel. |

---

## ❓ Frequently Asked Questions & Troubleshooting

### Q1: The Vercel app says "Connecting..." with a grey dot.
- **Cause:** Either Node-RED is not running, the Cloudflare tunnel was closed, or the `VITE_WS_URL` on Vercel does not match your active tunnel URL.
- **Fix:** Follow Option 2 steps above to verify Node-RED and `start-tunnel.bat` are running, and redeploy on Vercel with the current URL.

### Q2: How do I change the temperature thresholds?
- Open Node-RED at `http://localhost:1880`
- Double-click the **Config** function node
- Edit values for `warning` (default 30°C), `high` (35°C), or `critical` (40°C)
- Click **Done** ➔ Click the red **Deploy** button at top right.

### Q3: Why is Cloudflare Tunnel used instead of Ngrok?
- Ngrok's free tier intercepts automated WebSocket connections with an anti-phishing web page warning. Cloudflare Tunnel (`cloudflared`) provides direct, warning-free WebSocket passthrough.
