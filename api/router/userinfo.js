// 导入 express
const express = require("express"); // 创建路由对象
const router = express.Router();
const multer = require('multer');
//导入用户信息的处理函数
const userinfo = require('../router_handler/userinfo')
// 获取用户信息
router.get('/userinfo', userinfo.getUser)
// 更新用户的基本信息
router.post("/userinfo", userinfo.updateUserInfo);
// 重置密码的路由
router.post("/updatepwd", userinfo.changePassword);
// 更新用户头像
router.post("/update/avatar", multer({ dest: 'image' }).single('file'), userinfo.updateAvatar);
// 向外共享路由对象
module.exports = router;