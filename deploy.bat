@echo off
REM Deployment script for Nadisya Portfolio (Windows)

echo 🚀 Starting Nadisya Portfolio deployment...

REM Build and run with Docker Compose
echo 📦 Building Docker containers...
docker-compose down
docker-compose build --no-cache

echo 🏃 Starting containers...
docker-compose up -d

echo ⏳ Waiting for containers to be ready...
timeout /t 10 /nobreak > nul

REM Check if the application is running
echo 🔍 Checking application health...
curl -f http://localhost:3000 > nul 2>&1
if %errorlevel% equ 0 (
    echo ✅ Nadisya Portfolio is running successfully!
    echo 🌐 Access the website at: http://localhost:3000
    echo.
    echo 📊 Container status:
    docker-compose ps
) else (
    echo ❌ Application failed to start. Checking logs...
    docker-compose logs
)

echo.
echo 📝 Useful commands:
echo   View logs: docker-compose logs -f
echo   Stop: docker-compose down
echo   Restart: docker-compose restart
echo   Shell access: docker-compose exec nadisya-portfolio sh

pause
