const express = require('express');

const app = express();
const PORT = process.env.PORT || 3000;
const NODE_ENV = process.env.NODE_ENV || 'development';

app.get('/', (req, res) => {
    res.send(`
        <h1>Software Packaging Project</h1>
        <p>Node.js application is running successfully.</p>
        <p>Framework: Express</p>
        <p>Version: 1.0.0</p>
        <p>Environment: ${NODE_ENV}</p>
        <p>Port: ${PORT}</p>
    `);
});

app.listen(PORT, () => {
    console.log(`Application running on port ${PORT}`);
    console.log(`Environment: ${NODE_ENV}`);
});
