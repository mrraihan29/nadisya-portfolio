#!/bin/bash

# Deployment script for Nadisya Portfolio

echo "🚀 Starting Nadisya Portfolio deployment..."

# Build and run with Docker Compose
echo "📦 Building Docker containers..."
docker-compose down
docker-compose build --no-cache

echo "🏃 Starting containers..."
docker-compose up -d

echo "⏳ Waiting for containers to be ready..."
sleep 10

# Check if the application is running
echo "🔍 Checking application health..."
if curl -f http://localhost:3000 > /dev/null 2>&1; then
    echo "✅ Nadisya Portfolio is running successfully!"
    echo "🌐 Access the website at: http://localhost:3000"
    echo ""
    echo "📊 Container status:"
    docker-compose ps
else
    echo "❌ Application failed to start. Checking logs..."
    docker-compose logs
fi

echo ""
echo "📝 Useful commands:"
echo "  View logs: docker-compose logs -f"
echo "  Stop: docker-compose down"
echo "  Restart: docker-compose restart"
echo "  Shell access: docker-compose exec nadisya-portfolio sh"
