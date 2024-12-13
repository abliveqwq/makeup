const mysql = require('mysql2')

const db = mysql.createConnection({
    host: '127.0.0.1',
    user: 'root',
    password: '123456',
    database: 'makeup'
})

// 向外共享出db数据库连接对象
module.exports = db;