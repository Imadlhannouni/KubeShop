const express = require('express');
const http = require('http');
const app = express();

const PORT = process.env.PORT || 3000;
const CATALOG_URL = process.env.CATALOG_URL || 'http://localhost:8080';

app.get('/', (req, res) => {
    http.get(`${CATALOG_URL}/products`, (resp) => {
        let data = '';
        resp.on('data', (chunk) => { data += chunk; });
        resp.on('end', () => {
            let products = [];
            try {
                products = JSON.parse(data);
            } catch (e) {
                return res.send('Error parsing catalog data');
            }
            
            let html = `
            <html>
            <head><title>KubeShop</title></head>
            <body>
                <h1>Welcome to KubeShop</h1>
                <h2>Products</h2>
                <ul>
                    ${products.map(p => `<li>${p.name} - $${p.price}</li>`).join('')}
                </ul>
            </body>
            </html>
            `;
            res.send(html);
        });
    }).on("error", (err) => {
        res.send(`Error connecting to Catalog Service: ${err.message}`);
    });
});

app.get('/health', (req, res) => {
    res.send('OK');
});

app.listen(PORT, () => {
    console.log(`Frontend listening on port ${PORT}`);
});
