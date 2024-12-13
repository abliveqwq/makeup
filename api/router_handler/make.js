const { log } = require("console");
const db = require("../mysql/mysql");
const fs = require('fs');
const path = require('path')


// 公共轮播图
exports.getswpier = (req, res) => {
    const id = req.params.id;
    const sql = "SELECT * FROM m_image";
    db.query(sql, [id], (err, result) => {
        if (err) {
            return res.status(500).send({ status: 1, message: '数据库错误' });
        }
        return res.send({ status: 200, data: result });
    });
}
//查询分类
exports.gettype = (req, res) => {
    const id = req.params.id;
    const sql = "SELECT * FROM m_type";
    db.query(sql, [id], (err, result) => {
        if (err) {
            return res.status(500).send({ status: 1, message: '数据库错误' });
        }
        return res.send({ status: 200, data: result });
    });
}
// 查询列表
exports.getlist = (req, res) => {
    const id = req.params.id;
    const sql = "SELECT * FROM m_list";
    db.query(sql, [id], (err, result) => {
        if (err) {
            return res.status(500).send({ status: 1, message: '数据库错误' });
        }
        return res.send({ status: 200, data: result });
    });
}
// 查询详情
exports.getdetail = (req, res) => {
    const id = req.params.id;
    const sql = "SELECT * FROM m_detail";
    db.query(sql, [id], (err, result) => {
        if (err) {
            return res.status(500).send({ status: 1, message: '数据库错误' });
        }
        return res.send({ status: 200, data: result });
    });
}
//查询喜欢列表
exports.getLike = (req, res) => {
    // res.send("连接成功");
    const id = req.user.id;
    const sql = "select * from m_list l join m_like c on l.id=c.likeid  where user_id=?"
    db.query(sql, id, (err, result) => {
        if (err) {
            return res.cc(err, 500);
        } else {
            return res.send({ status: 200, data: result });
        }
    })
}
//发布喜欢列表
exports.saveLike = (req, res) => {
    const id = req.user.id;
    const like = req.body;
    console.log(req.body);
    const sql = "insert into m_like(likeid,user_id) values (?,?)";
    db.query(sql, [like.like, id], (err, result) => {
        if (err) {
            return res.status(500).send({ status: 1, message: '数据库错误' });
        } else {
            return res.send({ status: 200, data: result });
        }
    })
}
// 取消喜欢
exports.Dellike = (req, res) => {
    const userId = req.user.id;
    const likeId = req.params.id;
    console.log(likeId)
    const sql = "delete from m_like where user_id=? and likeid=?";
    db.query(sql, [userId, likeId], (err, result) => {
        if (err) {
            return res.status(500).send({ status: 1, message: '数据库错误' });
        } else {
            return res.send({ status: 200, data: result });
        }
    });
}
// 查询收藏信息
exports.getcoll = (req, res) => {
    // res.send("连接成功");
    const id = req.user.id;
    const sql = "select * from m_list l join m_coll c on l.id=c.collid  where user_id=?"
    db.query(sql, id, (err, result) => {
        if (err) {
            return res.cc(err, 500);
        } else {
            return res.send({ status: 200, data: result });
        }
    })
}
//发送收藏信息
exports.savecoll = (req, res) => {
    const id = req.user.id;
    const coll = req.body;
    console.log(req.body);
    const sql = "insert into m_coll(collid,user_id) values (?,?)";
    db.query(sql, [coll.coll, id], (err, result) => {
        if (err) {
            return res.status(500).send({ status: 1, message: '数据库错误' });
        } else {
            return res.send({ status: 200, data: result });
        }
    })
}
//取消收藏接口
exports.Delcoll = (req, res) => {
    const userId = req.user.id;
    const collId = req.params.id;
    console.log(collId)
    console.log(userId)
    const sql = "delete from m_coll where user_id=? and collid=?";
    db.query(sql, [userId, collId], (err, result) => {
        if (err) {
            return res.status(500).send({ status: 1, message: '数据库错误' });
        } else {
            return res.send({ status: 200, data: result });
        }
    });
}
// 查询评论
exports.getComment = (req, res) => {
    const id = req.params.id;
    const sql = "SELECT * FROM m_comment";
    db.query(sql, [id], (err, result) => {
        if (err) {
            return res.status(500).send({ status: 1, message: '数据库错误' });
        }
        return res.send({ status: 200, data: result });
    });
}
// 发布评论
exports.setComment = (req, res) => {
    const commid = req.body;
    const avatar = req.body;
    const username = req.body;
    const comment = req.body;
    console.log(commid.commid, avatar.avatar, username.username, comment.comment);
    const sql = "insert into m_comment(commid,username,avatar, comment) values (?, ?, ?, ?)";
    db.query(sql, [commid.commid, username.username, avatar.avatar, comment.comment], (err, result) => {
        if (err) {
            return res.status(500).send({ status: 1, message: '数据库错误' });
        }
        // 检查更新是否成功
        if (result.affectedRows !== 1) {
            return res.status(404).send({ status: 1, message: '用户信息更新失败' });
        }

        return res.send({ status: 200, data: result });
    })
}

// 发布列表
exports.publish = async (req, res) => {
    let { typeid, type, image, name, line } = req.body;
    image = image.length == 0 ? null : image
    let images = ""
    for (let i = 0; i < image.length; i++) {
        images += image[i] + ','
    }
    const sql = `
       INSERT INTO m_list (typeid, type, images, name, line)
VALUES (?, ?, ?, ?, ?)
`;
    const sql2 = `
        INSERT INTO m_detail (typeid, type,images, name, line)
         VALUES (?, ?, ?, ?, ?)`;
    try {
        const results2 = db.query(sql, [typeid, type, images, name, line]);
        const results3 = db.query(sql2, [typeid, type, images, name, line]);
        console.log(typeid, type, images, name, line,);

        return res.send({
            status: 200, data: {
                result2: results2[0],
                result3: results3[0]
            }
        });
    } catch (error) {
        console.error(error);
        return res.status(500).send(error);
    }
};

// 上传图片
exports.updataImage = async (req, res) => {
    console.log(req.file);
    var appendName = req.file.originalname.split('.')[1]
    console.log(req.file);

    const newFileName = `${req.file.filename}.${appendName}`;
    console.log(9999);

    const newPath = path.join(__dirname, `../image/pubilsh/${newFileName}`);
    // 确保目标文件夹存在
    fs.mkdirSync(path.dirname(newPath), { recursive: true });
    //fs重命名文件，第一个参数为上传文件绝对路径，第二个参数为相对路径
    //第三个参数可选
    console.log("66666666");

    fs.rename(req.file.path, newPath, function (err) {
        if (err) throw err;
        const folders = ['../image/pubilsh', '../image/list', '../image/detail']; // 修改路径
        folders.forEach(folder => {
            const folderPath = path.join(__dirname, folder);
            // 确保每个目标文件夹存在
            fs.mkdirSync(folderPath, { recursive: true });
            const destPath = path.join(folderPath, newFileName);
            fs.copyFile(newPath, destPath, (err) => {
                if (err) throw err;
            });
        });
    })
    res.send({ status: 200, data: newFileName });
};

//查询化妆品分类
exports.gethzptype = (req, res) => {
    const id = req.params.id;
    const sql = "SELECT * FROM m_hzptype";
    db.query(sql, [id], (err, result) => {
        if (err) {
            return res.status(500).send({ status: 1, message: '数据库错误' });
        }
        return res.send({ status: 200, data: result });
    });
}

// 查询化妆品列表
exports.gethzplist = (req, res) => {
    const id = req.params.id;
    const sql = "SELECT * FROM m_hzplist";
    db.query(sql, [id], (err, result) => {
        if (err) {
            return res.status(500).send({ status: 1, message: '数据库错误' });
        }
        return res.send({ status: 200, data: result });
    });
}

// 查询购物车
exports.getshop = (req, res) => {
    // res.send("连接成功");
    const id = req.user.id;
    const sql = "select * from m_hzplist l join m_shoppping c on l.id=c.shopid  where user_id=?"
    db.query(sql, id, (err, result) => {
        if (err) {
            return res.cc(err, 500);
        } else {
            return res.send({ status: 200, data: result });
        }
    })
}

// 加入购物车
exports.postshop = (req, res) => {
    const id = req.user.id;
    const shop = req.body;
    console.log(req.body);
    const sql = "insert into m_shoppping(shopid,user_id) values (?,?)";
    db.query(sql, [shop.shop, id], (err, result) => {
        if (err) {
            return res.status(500).send({ status: 1, message: '数据库错误' });
        } else {
            return res.send({ status: 200, data: result });
        }
    })
}
// 删除购物车
exports.delshop = (req, res) => {
    const userId = req.user.id;
    const shopid = req.params.shopid;
    console.log(shopid)
    console.log(userId)
    const sql = "delete from m_shoppping where user_id=? and id=?";
    db.query(sql, [userId, shopid], (err, result) => {
        if (err) {
            return res.status(500).send({ status: 1, message: '数据库错误' });
        } else {
            return res.send({ status: 200, data: result });
        }
    });
}

// 清空购物车
exports.delallshop = (req, res) => {
    const userId = req.user.id; // 从请求中获取用户 ID
    console.log(userId);
    const sql = "delete from m_shoppping where user_id=?";
    db.query(sql, [userId], (err, result) => {
        if (err) {
            return res.status(500).send({ status: 1, message: '数据库错误' });
        }
        if (result.affectedRows === 0) {
            return res.send({ status: 404, message: '没有找到购物车项' });
        }
        return res.send({ status: 200, message: '购物车已清空' });
    });
}

// 查询地址
exports.getaddress = (req, res) => {
    const id = req.user.id;
    const sql = "SELECT * FROM m_address";
    db.query(sql, id, (err, result) => {
        if (err) {
            return res.cc(err, 500);
        } else {
            return res.send({ status: 200, data: result });
        }
    })
}
//添加地址
exports.putaddress = (req, res) => {
    const id = req.user.id;
    const { recipient_name, phone_number, address } = req.body;
    console.log(id, recipient_name, phone_number, address)
    const sql = "insert into m_address(user_id,recipient_name, phone_number, address) values (?,?,?,?)";
    db.query(sql, [id, recipient_name, phone_number, address], (err, result) => {
        if (err) {
            return res.status(500).send({ status: 1, message: '数据库错误' });
        } else {
            return res.send({ status: 200, data: result });
        }
    })
}
// 删除地址
