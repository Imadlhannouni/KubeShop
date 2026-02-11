.PHONY: install setup run clean docker-build

# Default target
all: install run

# Install Python dependencies
install:
	@echo "📦 Installing Python dependencies..."
	pip install -r requirements.txt

# Setup the environment (currently just install, but extensible)
setup: install
	@echo "✅ Setup complete. Run 'make run' to start the dashboard."

# Run the Web Dashboard
run:
	@echo "🚀 Starting KubeShop Dashboard..."
	@echo "👉 Open http://localhost:5000 in your browser"
	python3 dashboard/app.py

# Helper to build all docker images for the app (for manual testing)
docker-build:
	@echo "🐳 Building Docker images..."
	docker build -t kubeshop/catalog:v1 src/catalog
	docker build -t kubeshop/frontend:v1 src/frontend
	docker build -t kubeshop/order:v1 src/order
	docker build -t kubeshop/payment:v1 src/payment
	@echo "✅ Images built."

# Clean up
clean:
	find . -type d -name "__pycache__" -exec rm -rf {} +
