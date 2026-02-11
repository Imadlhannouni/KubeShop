.PHONY: install setup run clean docker-build venv

VENV := .venv
PYTHON := $(VENV)/bin/python3
PIP := $(VENV)/bin/pip

# Default target
all: install run

# Create virtual environment
venv:
	@echo "🔧 Creating virtual environment..."
	python3 -m venv $(VENV)

# Install Python dependencies inside venv
install: venv
	@echo "📦 Installing Python dependencies..."
	$(PIP) install -r requirements.txt

# Setup the environment
setup: install
	@echo "✅ Setup complete. Run 'make run' to start the dashboard."

# Run the Web Dashboard using venv python
run:
	@echo "🚀 Starting KubeShop Dashboard..."
	@echo "👉 Open http://localhost:5000 in your browser"
	$(PYTHON) dashboard/app.py

# Helper to build all docker images
docker-build:
	@echo "🐳 Building Docker images..."
	docker build -t kubeshop/catalog:v1 src/catalog
	docker build -t kubeshop/frontend:v1 src/frontend
	docker build -t kubeshop/order:v1 src/order
	docker build -t kubeshop/payment:v1 src/payment
	@echo "✅ Images built."

# Clean up
clean:
	rm -rf $(VENV)
	find . -type d -name "__pycache__" -exec rm -rf {} +
