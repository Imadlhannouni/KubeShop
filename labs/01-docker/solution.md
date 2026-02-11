# Solution: Lab 01

```bash
# 1. Build the image
cd ../../src/catalog
docker build -t kubeshop/catalog:v1 .

# 2. Run the container
docker run -d -p 8080:8080 --name catalog kubeshop/catalog:v1

# 3. Verify
curl localhost:8080/products
```
