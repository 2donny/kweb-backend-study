const http = require('http');
const port = 3000;
const hostname = '127.0.0.1';
const axios = require('axios');

const server = http.createServer((req, res) => {
    try {
        res.statusCode = 200;
        res.setHeader('Content-Type', 'text/plain');
        axios.get('https://api.github.com/repos/nodejs/ode')
            .then(response => {
                const { stargazers_count, forks_count, open_issues_count } = response.data;
                res.end(`Startgazers: ${stargazers_count}\nForks : ${forks_count}\nOpen Issues : ${open_issues_count}`);
            })
            .catch(err => {
                res.statusCode = 500;
                res.setHeader('Content-Type', 'text/plain');
                res.end('API error Issued.');
            })
    }catch(err){
        res.statusCode = 500;
        res.setHeader('Content-Type', 'text/plain');
        res.end('Internal error Issued.');
    }
});

server.listen(port, hostname, () => {
    console.log(`Server running at http://${hostname}:${port}/`)
})