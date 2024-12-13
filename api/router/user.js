const express = require('express')
// 创建用户模块
const router = express.Router();
//导入user_handler
const user = require('../router_handler/user')

// 登录
router.post('/login', user.login)
// 注册
router.post('/reguser', user.reguser)

// 将路由对象共享出去
module.exports = router;