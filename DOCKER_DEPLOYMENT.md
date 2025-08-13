# Nadisya Portfolio - Docker Deployment Guide

This guide explains how to containerize and deploy the Nadisya Portfolio website using Docker.

## 🐳 Docker Setup

### Prerequisites

- Docker and Docker Compose installed
- All project files in the same directory

### Files Created

- `Dockerfile` - Multi-stage build for production
- `docker-compose.yml` - Service orchestration
- `.dockerignore` - Exclude unnecessary files
- `nginx.conf` - Reverse proxy configuration
- `healthcheck.js` - Application health monitoring
- `deploy.sh` / `deploy.bat` - Deployment scripts

## 🚀 Quick Deployment

### Option 1: Using Docker Compose (Recommended)

```bash
# Build and start containers
docker-compose up -d --build

# Check status
docker-compose ps

# View logs
docker-compose logs -f
```

### Option 2: Using Deployment Scripts

**Linux/Mac:**

```bash
chmod +x deploy.sh
./deploy.sh
```

**Windows:**

```cmd
deploy.bat
```

## 🌐 Access Your Website

- **Local Development**: http://localhost:3000
- **Production**: Configure your domain in `nginx.conf`

## 📋 Container Management

### Start/Stop Services

```bash
# Start
docker-compose up -d

# Stop
docker-compose down

# Restart
docker-compose restart
```

### View Logs

```bash
# All services
docker-compose logs -f

# Specific service
docker-compose logs -f nadisya-portfolio
```

### Shell Access

```bash
docker-compose exec nadisya-portfolio sh
```

## 🔧 Configuration

### Environment Variables

Edit `docker-compose.yml` to customize:

- `PORT` - Application port (default: 3000)
- `NODE_ENV` - Environment (production/development)

### Domain Configuration

1. Edit `nginx.conf`
2. Replace `portfolio.example.com` with your domain
3. Configure SSL certificates if needed

### SSL Setup (Optional)

1. Place SSL certificates in `./ssl/` directory
2. Uncomment SSL configuration in `nginx.conf`
3. Update certificate paths

## 📊 Monitoring

### Health Checks

- Built-in health check every 30 seconds
- Automatic restart on failure
- Custom health check endpoint

### Container Status

```bash
# Check running containers
docker-compose ps

# Resource usage
docker stats

# Application health
curl http://localhost:3000
```

## 🚀 Production Deployment

### Cloud Platforms

**DigitalOcean/Linode/AWS:**

1. Clone repository to server
2. Install Docker and Docker Compose
3. Run deployment script
4. Configure domain and SSL

**Docker Hub:**

```bash
# Build and tag image
docker build -t username/nadisya-portfolio .

# Push to registry
docker push username/nadisya-portfolio

# Deploy on any server
docker run -d -p 3000:3000 username/nadisya-portfolio
```

### Scaling

```bash
# Scale to multiple instances
docker-compose up -d --scale nadisya-portfolio=3
```

## 🔒 Security

### Production Checklist

- [ ] Change default ports
- [ ] Configure SSL certificates
- [ ] Set up firewall rules
- [ ] Use environment variables for secrets
- [ ] Enable logging and monitoring
- [ ] Regular security updates

### Network Security

```bash
# Create custom network
docker network create nadisya-network

# Use in docker-compose.yml
networks:
  default:
    external:
      name: nadisya-network
```

## 🐛 Troubleshooting

### Common Issues

**Container won't start:**

```bash
docker-compose logs nadisya-portfolio
```

**Port already in use:**

```bash
# Find process using port 3000
netstat -tulpn | grep 3000
# Kill process or change port
```

**Build failures:**

```bash
# Clean build
docker-compose build --no-cache
docker system prune -a
```

### Debug Mode

```bash
# Run with debug output
DEBUG=* docker-compose up

# Interactive container
docker run -it --rm nadisya-portfolio sh
```

## 📈 Performance Optimization

### Image Optimization

- Multi-stage build reduces image size
- Only production dependencies included
- Static assets properly cached

### Resource Limits

```yaml
# Add to docker-compose.yml
deploy:
  resources:
    limits:
      memory: 512M
      cpus: '0.5'
```

### Caching

- Nginx caches static assets
- Docker layer caching for faster builds
- Browser caching headers configured

## 🔄 CI/CD Integration

### GitHub Actions Example

```yaml
name: Deploy Nadisya Portfolio
on:
  push:
    branches: [main]
jobs:
  deploy:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v2
      - name: Deploy to server
        run: |
          docker-compose up -d --build
```

### Automated Backups

```bash
# Backup static files
docker run --rm -v $(pwd)/static:/backup alpine tar czf /backup/static-backup.tar.gz /backup
```

---

## 🎉 Success!

Your Nadisya Portfolio is now containerized and ready for deployment!

**Next Steps:**

1. Test locally: `docker-compose up -d`
2. Configure your domain
3. Set up SSL certificates
4. Deploy to production server
5. Monitor and maintain

For support, check the logs or open an issue in the repository.
