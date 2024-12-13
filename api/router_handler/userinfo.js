const db = require("../mysql/mysql");
const bcrypt = require('bcryptjs');
const fs = require('fs');
const path = require('path');

//获取用户信息
exports.getUser = (req, res) => {
    // 从请求的查询参数中获取用户ID
    const Id = req.user.id;
    console.log(Id)
    // 编写 SQL 查询语句，查询用户信息
    const sql = 'SELECT id,username, phone, avatar,nickname,sex,profile FROM m_user WHERE id = ?';
    // 执行 SQL 查询
    db.query(sql, [Id], (err, results) => {
        if (err) {
            return res.status(500).send({ status: 1, message: '数据库错误' });
        }
        if (results.length !== 1) {
            return res.status(404).send({ status: 1, message: '用户未找到' });
        }
        // 将用户信息从结果中提取出来
        const user = results[0];
        res.json({ message: '用户信息获取成功', user });
    });
};

// 修改用户信息的接口
exports.updateUserInfo = (req, res) => {
    // 从请求体中获取要更新的用户信息
    const { avatar, nickname, sex, phone, profile } = req.body;
    const Id = req.user.id;
    // 检查请求体中是否包含至少一个字段
    if (!avatar && !nickname && !sex && !phone && !profile) {
        return res.status(400).send({ status: 1, message: '至少提供一个字段进行更新' });
    }
    // 编写 SQL 更新语句
    const sql = 'UPDATE m_user SET  avatar = ?, nickname = ?, sex = ?, phone = ?,profile = ? WHERE id = ?';
    // // 执行 SQL 更新操作
    db.query(sql, [avatar, nickname, sex, phone, profile, Id], (err, results) => {
        if (err) {
            console.error("数据库更新失败:", err);
            return res.status(500).send({ status: 1, message: '数据库错误' });
        }
        // 检查更新是否成功
        if (results.affectedRows !== 1) {
            return res.status(404).send({ status: 1, message: '用户信息更新失败' });
        }
        res.send({ status: 0, message: '用户信息更新成功' });
    });
};

// 更改密码接口
exports.changePassword = (req, res) => {
    const userId = req.user.id; // 获取用户ID（假设用户已通过身份验证）
    const { oldPassword, newPassword } = req.body; // 从请求体中获取旧密码和新密码
    if (!oldPassword || !newPassword) {
        return res.status(400).send({ status: 1, message: '旧密码和新密码不能为空' });
    }
    // 查询用户当前密码哈希
    const sql = 'SELECT password FROM m_user WHERE id = ?';
    db.query(sql, [userId], async (err, results) => {
        if (err) {
            return res.status(500).send({ status: 1, message: '数据库错误' });
        }
        if (results.length !== 1) {
            return res.status(404).send({ status: 1, message: '用户未找到' });
        }
        const hashedPassword = results[0].password;
        // 验证旧密码
        const match = await bcrypt.compare(oldPassword, hashedPassword);
        if (!match) {
            return res.status(401).send({ status: 1, message: '旧密码不正确' });
        }
        // 检查新密码的有效性
        if (newPassword.length < 6) {
            return res.status(400).send({ status: 1, message: '新密码长度不能少于6个字符' });
        }
        // 加密新密码
        const newHashedPassword = await bcrypt.hash(newPassword, 10);
        // 更新密码
        const updateSql = 'UPDATE m_user SET password = ? WHERE id = ?';
        db.query(updateSql, [newHashedPassword, userId], (updateErr) => {
            if (updateErr) {
                return res.status(500).send({ status: 1, message: '更新密码失败' });
            }
            res.send({ message: '密码更改成功' });
            console.log(newHashedPassword)
        });
    });
};
// 更新用户头像
exports.updateAvatar = async (req, res) => {
    var appendName = req.file.originalname.split('.')[1]
    //fs重命名文件，第一个参数为上传文件绝对路径，第二个参数为相对路径
    //第三个参数可选
    fs.rename(req.file.path, `image/${req.file.filename}.${appendName}`, function (err) {
        if (err) throw err
    })
    res.send({ status: 200, data: req.file.filename + '.' + appendName });
};
