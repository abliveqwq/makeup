const express = require('express');
const cors = require('cors')
const app = express();
const path = require('path');
const expressJWT = require("express-jwt");

app.use(express.static('image'))
app.use(cors());
app.use(
    expressJWT({ secret: "your_jwt_secret" }).unless({ path: [/^\/user\//] })
);
app.use(express.json());
app.use(express.static(path.join(__dirname, 'public')));
//简单封装
app.use((req, res, next) => {
    res.cc = (err, status = 1) => {
        res.send({ status, message: err instanceof Error ? err.message : err });
    }
    next()
});

//导入用户路由
const userRouter = require('./router/user')
app.use("/user", userRouter)
//导入用户信息路由
const userinfoRouter = require('./router/userinfo')
app.use("/info", userinfoRouter)
//导入公共路由
const makeinfo = require('./router/make')
app.use("/api", makeinfo)

// 监听服务端的连接状态
app.listen(3006, () => {
    console.log('http://127.0.0.1:3006');
});