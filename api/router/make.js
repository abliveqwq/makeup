const express = require('express')
// 创建用户模块
const router = express.Router();
// 导入make模块
const make = require('../router_handler/make')
const multer = require('multer');

//公共轮播图
router.get('/swiper', make.getswpier);
// 分类
router.get('/type', make.gettype);
// 查询列表
router.get('/list', make.getlist);
//查询详情
router.get('/detail', make.getdetail);
//查询喜欢列表
router.get('/like', make.getLike);
//发送喜欢列表
router.post('/like', make.saveLike);
// 取消喜欢
router.get('/dellike/:id', make.Dellike);
// 查询收藏列表
router.get('/coll', make.getcoll);
//发送收藏
router.post('/coll', make.savecoll);
//取消收藏
router.get('/delcoll/:id', make.Delcoll);
// 查询评论
router.get('/comment', make.getComment);
// 发布评论
router.post('/comment', make.setComment);
// 发布列表
router.post('/publish', make.publish);
// 上传图片
router.post("/update/image", multer({ dest: 'image/pubilsh' }).single('file'), make.updataImage);
// 查询化妆品分类
router.get('/hzptype', make.gethzptype)
// 查询化妆品列表
router.get('/hzplist', make.gethzplist)
// 查询化妆品
router.get('/shop', make.getshop)
// 加入购物车
router.post('/shop', make.postshop)
// 删除购物车
router.get('/delshop/:shopid', make.delshop)
// 清空购物车
router.get('/delallshop', make.delallshop)
//查询地址
router.get('/address', make.getaddress)
// 添加地址
router.post('/address', make.putaddress)
// 将路由对象共享出去
module.exports = router;