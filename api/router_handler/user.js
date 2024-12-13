const db = require('../mysql/mysql')
const bcrypt = require('bcryptjs');
const jwt = require('jsonwebtoken');

//登录接口
exports.login = (req, res) => {
    const { username, password } = req.body;
    console.log(username, password);
    const sql = 'SELECT * FROM m_user WHERE username = ?';
    db.query(sql, [username], (err, results) => {
        console.log(username)
        if (err) {
            return res.cc(err, 500)
        }
        if (results.length !== 1) {
            console.log(results.length)
            return res.send({ status: 1, message: '登录失败' });
        }
        const compareResult = bcrypt.compareSync(password, results[0].password);
        if (!compareResult) {
            return res.send({ status: 1, message: '密码输入错误' });
        }
        const user = { ...results[0], password: "", user_pic: "" };
        console.log(user)
        const token = jwt.sign({ id: user.id, username: user.username }, 'your_jwt_secret', { expiresIn: '24h' });
        console.log(token)
        res.json({ message: '登录成功', token });
    });
}

// 注册接口
exports.reguser = (req, res) => {
    const { username, password } = req.body;
    if (!username || !password) {
        return res.status(400).json({ message: '用户名和密码不能为空' });
    }

    try {
        // 查询用户名是否存在
        const checkSql = "SELECT * FROM m_user WHERE username = ?";
        db.query(checkSql, [username], (err, results) => {
            if (err) {
                console.log(err.message);
                return res.status(500).json({ message: '服务器错误' });
            }

            if (results.length > 0) {
                // 用户名已存在
                return res.status(400).json({ message: '用户名已存在' });
            }

            // 加密密码
            const hashedPassword = bcrypt.hashSync(password, 10);
            const insertSql = "INSERT INTO m_user (username, password) VALUES (?, ?)";

            // 插入用户到数据库
            db.query(insertSql, [username, hashedPassword], (err) => {
                if (err) {
                    console.log(err.message);
                    return res.status(500).json({ message: '注册用户失败' });
                }
                res.status(201).json({ message: '用户注册成功' });
            });
        });
    } catch (error) {
        res.status(500).json({ message: '服务器错误' });
    }
};



