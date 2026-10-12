# Smart Temperature Monitoring, Predictive Alert & Email Notification System

A real-time temperature monitoring system built with **Node-RED** (IoT backend) and **React + Vite** (premium dashboard frontend).

## Architecture

```
Node-RED (localhost:1880)     ◄── WebSocket ──►     React Dashboard (localhost:5173)
  ├── Temperature Input                                ├── Real-time Gauges
  ├── Data Processing                                  ├── Temperature Charts
  ├── Classification                                   ├── Alert Feed
  ├── Alert Engine                                     ├── Prediction Display
  ├── State Management                                 └── System Status
  ├── Prediction
  └── Email Notification
```

## Quick Start

### 1. Start Node-RED
```bash
# Option A: Double-click start-nodered.bat
# Option B: Command line
node-red --userDir "./nodered" --settings "./nodered/settings.js"
```
Opens at: http://localhost:1880

### 2. Start Dashboard
```bash
# Option A: Double-click start-dashboard.bat
# Option B: Command line
cd dashboard
npm run dev
```
Opens at: http://localhost:5173

## Project Structure

```
Temp-system/
├── nodered/                  # Node-RED backend
│   ├── settings.js           # Node-RED configuration
│   ├── flows.json            # Node-RED flows (auto-saved)
│   └── node_modules/         # Node-RED packages
├── dashboard/                # React + Vite frontend
│   ├── src/                  # React source code
│   ├── index.html            # Entry point
│   └── vite.config.js        # Vite configuration
├── start-nodered.bat         # Node-RED launcher
├── start-dashboard.bat       # Dashboard launcher
└── README.md                 # This file
```

## Technology Stack

| Component | Technology |
|-----------|-----------|
| IoT Backend | Node-RED v5.0.4 |
| Frontend | React + Vite |
| Communication | WebSocket |
| Language | JavaScript |
| Email | Gmail SMTP |
| Charts | Chart.js / Recharts |
