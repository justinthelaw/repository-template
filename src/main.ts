/* eslint-disable @typescript-eslint/no-unsafe-assignment */
/* eslint-disable @typescript-eslint/no-unsafe-member-access */
/* eslint-disable @typescript-eslint/no-unsafe-call */
import * as http from 'http'

const server = http.createServer((_, res: http.ServerResponse) => {
    res.statusCode = 200
    res.setHeader('Content-Type', 'text/plain')
    res.end('Hello, World!\n')
})

server.listen(5173, 'localhost', () => {
    console.log('Server running at http://localhost:5173/')
})
