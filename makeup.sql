-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: makeup
-- ------------------------------------------------------
-- Server version	8.0.30

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `m_address`
--

DROP TABLE IF EXISTS `m_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `m_address` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `recipient_name` varchar(455) NOT NULL,
  `phone_number` varchar(455) NOT NULL,
  `address` varchar(455) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='地址';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m_address`
--

LOCK TABLES `m_address` WRITE;
/*!40000 ALTER TABLE `m_address` DISABLE KEYS */;
INSERT INTO `m_address` VALUES (2,1,'李四','18573947393','湖南'),(6,1,'张三','12345678910','湖南省株洲市');
/*!40000 ALTER TABLE `m_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `m_coll`
--

DROP TABLE IF EXISTS `m_coll`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `m_coll` (
  `id` int NOT NULL AUTO_INCREMENT,
  `collid` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='收藏表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m_coll`
--

LOCK TABLES `m_coll` WRITE;
/*!40000 ALTER TABLE `m_coll` DISABLE KEYS */;
INSERT INTO `m_coll` VALUES (26,1,13),(27,2,13),(28,4,13),(30,2,14),(31,3,14),(32,6,14),(37,6,15),(38,1,15),(40,6,16);
/*!40000 ALTER TABLE `m_coll` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `m_comment`
--

DROP TABLE IF EXISTS `m_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `m_comment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `commid` int DEFAULT NULL,
  `username` varchar(455) DEFAULT NULL,
  `avatar` text,
  `comment` varchar(455) DEFAULT NULL,
  `time` varchar(455) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='评论表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m_comment`
--

LOCK TABLES `m_comment` WRITE;
/*!40000 ALTER TABLE `m_comment` DISABLE KEYS */;
INSERT INTO `m_comment` VALUES (40,1,'231','3104908d45e4ef269c9590dc0075442f.jpg','1',NULL),(41,1,'231','3104908d45e4ef269c9590dc0075442f.jpg','123',NULL),(42,2,'231','3104908d45e4ef269c9590dc0075442f.jpg','1111',NULL);
/*!40000 ALTER TABLE `m_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `m_detail`
--

DROP TABLE IF EXISTS `m_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `m_detail` (
  `id` int NOT NULL AUTO_INCREMENT,
  `typeid` varchar(455) DEFAULT NULL,
  `type` varchar(455) DEFAULT NULL,
  `images` text,
  `name` varchar(455) DEFAULT NULL,
  `line` varchar(455) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='详情表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m_detail`
--

LOCK TABLES `m_detail` WRITE;
/*!40000 ALTER TABLE `m_detail` DISABLE KEYS */;
INSERT INTO `m_detail` VALUES (1,'1','淡妆新手','cdvdvsdvs.jpg,cacascfw.jpg,csdcsdvda.jpg,dcdcsdvsd.jpg,ccsdvsdv.jpg,scascvsdvsd.jpg,swsefrvfdvbd.jpg','为啥没人画苍井优这种氧气妆了？真的好灵动','之前发优酱这篇的时候就有好多老婆们很好奇这样的卧蚕是怎么画出来的～\n这不！详细教程来啦！\n自然氧气妈生卧蚕太灵动啦～'),(2,'1','淡妆新手','dscasdcsd.jpg,sacdvger.jpg,ascavwgs.jpg,axcsavdvw.jpg,asscadvd.jpg,dxascascfew.jpg,saxascd.jpg,ascdasvasd.jpg,adascasca.jpg,acavcadva.jpg,dcasdcadc.jpg','新手小白一看就会的淡妆！','这个淡妆我能化365天，特别简单啊'),(3,'1','淡妆新手','sxcascas.jpg,saascaca.jpg,wsxacasca.jpg,xascaca.jpg,axascdfwe.jpg,axcascvav.jpg,axasdsfwefc.jpg','这才是普通人的日常淡妆，新手学起来！','日常伪素颜妆给人一种精简的慵懒感～\n一些小tips?\n·底妆首先要轻薄无暇，粉底一定是少量多次的叠加不然太厚重也会容易卡粉哦?‍♀️\n·妆容色调统一可以用口红来决定 搞定整个妆容简单易上手，鼻尖下巴处是整个妆容的精髓口红用的水光版原色裸带点肉桂调的裸杏色 和各个妆面的适配度都很高'),(4,'1','淡妆新手','dsacacascasc.jpg,axascsadfcws.jpg,sxascafc.jpg,adxascac.jpg,saxascvsdc.jpg,axascsaca.jpg,asxascadc.jpg,xascsacasc.jpg,xsvsdvs.jpg','圆脸~新手万能淡妆公式','不论是暴晒还是阴天都离不开防晒\n欧莱雅小金管在我这算是天花板了！\n不仅是高倍防晒而且上脸不会感觉油腻腻的，肤感nice??\n再加上欧莱雅磨皮大王粉饼\n轻松get白开水底妆伪素颜\n出门一天都不带脱妆的\n简直就是早八通勤宝子们的福音～'),(5,'2','韩系妆容','aascascasd.jpg,acascadw.jpg,ascxascdfcsd.jpg,ascadvsdv.jpg,adacascsac.jpg,wdascacas.jpg,dascacasc.jpg','韩系女高妆教程从新手到大师的秘诀！','韩系女高妆的特点，此现实中韩系妆容受欢迎的程度很高，韩系女高妆的特点是什么：\n✨底妆清透：韩系妆容讲究轻薄透亮，因此底妆是关键因素，一定要把肌肤保养好，做好打底工作，这样才能为后续妆容打好基础。\n✨眼妆深邃有神：韩系妆容的眼妆画法有很多，最明显的一个特征就是眼线+眼影，这样让眼睛显得更加有神，放大作用也更加明显。但是大家要记住一点，内眼线不要画太明显，不然看着会很突兀，想要打造深邃眼妆就用棕色或咖啡色眼影晕染在眼窝和下眼睑处。\n✨卧蚕明显：有卧蚕的存在，即使是小眼睛也能变成炯炯有神的大眼既视感。但是卧蚕的存在感不要过于强烈，因为过于宽或者明显的卧蚕并不适合日常，会影响整个妆容的精致感，画法也很简单，米白色珠光眼影少量多次晕染在下眼睑处，再用【眼影刷】把双眼皮褶皱处的空隙填充好，这样即使你是肿泡眼或者单眼皮都能拥有可爱的卧蚕。\n✨水光肌：韩系妆容还有一一个很大的特点就是自然光泽肌，韩剧女主即使在录节目时镜头怼到脸上，皮肤都会是发着光的，其实她们也是擦了高光，想要打造同款效果可以用【湿粉或水光喷雾】'),(6,'2','韩系妆容','acadcadc.jpg,dascascds.jpg,qdxascasc.jpg,xascasc.jpg,ascavad.jpg,ascavad.jpg,adcascasc.jpg,sxascasc.jpg,dcacasdc.jpg,asdcascasc.jpg,dcacascas.jpg','古早韩妆！无假睫毛+粗眼线+水光感太灵噜～','?调色：\n色温-33 色调+5 对比度+5 高光+5 自然饱和度+30\n\n只需要几个单色腮红+眼线笔+修容高光盘就能get的简单妆容，用水光感的高光局部点涂面部骨骼点完全可以模拟水光感！\n眼线：橘朵眼线笔\n腮红：橘朵腮红 06/35/43'),(7,'2','韩系妆容','ascasc.jpg,sacadcasdc.jpg,asxasxa.jpg,aacdascas.jpg,xsascasca.jpg,acascaca.jpg','中式狐狸眼 韩系兔兔眼｜新手眼线教程！','不同的眼线可以改变我们的眼型！小宝们更喜欢哪个眼线捏！\n✨中式狐狸眼线：首先画一个棕色的眉毛，然后用哑光高光提亮眼头，用细节刷蘸取棕色画一个自然的卧蚕，刀锋刷蘸取深棕色从眼睛最低点向后拉出一条下至，仰头也要记得加深！刀锋刷蘸取深棕色从眼睛最高点向后平着拉出一条上扬的狐狸眼线，注意不要画得太长～\n✨韩系兔兔眼线：首先画一个浅色的毛绒感眉毛，然后用细节刷蘸取棕色画下垂感卧蚕，细节刷蘸取粉棕色加深下至和眼头，最后用刀锋刷蘸取深棕色画下垂感眼线，将眼睛后半段的凹陷填充成圆弧！'),(8,'3','日系','adasdas.jpg,acacasc.jpg,asdascac.jpg,cacaca.jpg,xascascsac.jpg,axasxasxasxa.jpg','新中式狐狸眼 日系狗狗眼｜新手眼妆教程！','两种好不一样的风格～小宝们更喜欢哪个捏～\n✨新中式狐狸眼：首先用黑灰色画一个微挑的眉毛，然后用细节刷蘸取棕色画出卧蚕，用浅棕色大面积打底给眼睛消肿，增加氛围感，然后用细节刷蘸取红棕色贴着睫毛根部画出下至，加深眼头！眼线从眼睛的最高点向后平着拉出，注意不要画得太长！最后贴上斜飞睫毛就完成啦！\n✨日系狗狗眼：首先画一个棕色的毛绒感眉毛，然后用细节刷蘸取棕色画出下垂感卧蚕，再用细节刷蘸取粉棕色画一个下垂的下至，最后用细节刷蘸取，深棕色画下垂感眼线和下至连接，最后贴上睫毛就完成啦！'),(9,'3','日系','cascas.jpg,wsaxdadaqwd.jpg,sdadqawd.jpg,saxdasdwdw.jpg,asdcaasdcw.jpg,asaqdwqdds.jpg','为什么现在都没人画刘亦菲这种妆了？？好娇媚','菲菲宝宝的妆能画10086遍！！\n太神了！！\n谁画谁美～'),(10,'3','日系','cacascac.jpg,cadcsca.jpg,acasdasd.jpg,adadadsd.jpg,dasdasd.jpg,sddcsxas.jpg','妆面记录｜秋冬日杂氧气感','日杂妆真的是普通淡颜女孩必备拿手妆容之一了\n充分发挥我们的优势\n甜甜的漫画美少女感轻松拿捏\n而且这个色调也泰适合秋冬啦！'),(11,'4','亚裔','xaxasxas.jpg,axdsadwd.jpg,asadde.jpg,asxasdqwd.jpg,daddsdcas.jpg,dadsxcdsf.jpg','内双塌鼻梁的ins女高亚裔妆容','拽拽的 辣辣的'),(12,'4','亚裔','adxasxsa.jpg,dcscfsdcs.jpg,cadasda.jpg,csdcscs.jpg','千禧烟熏妆｜妆容教程','Uhue单色眼影上新了！\n新品Y3K系列\n我上眼用到的是K05黑陨星\n这就是传说中五彩斑斓的黑！！\n金属烟黑底色➕色彩缤纷的细闪\n可浓可淡可叠加的粉质\n干爽的干粉质地，轻松上色\n清透的同时，显色度和持妆度也更好！\n单用指腹晕染就可以完成日常小烟熏\n光线折射下的五彩细闪绝美～\n比单色烟熏又多出几分层次感\n烟熏爱好者的偷懒神器！！'),(13,'4','亚裔','dsxasdxasx.jpg,sdcadad.jpg,csdcsxa.jpg,dqadwqsd.jpg,asxdasdxas.jpg,dsddesw.jpg,dwdasx.jpg','塌鼻梁来学亚裔感详细修鼻?教程❗️巨立体！','我的鼻子修容是看了很多喜欢的博主\n然后总结出来自己喜欢的一个修容方式\n大家如果鼻子跟我一样\n又是塌鼻梁，鼻子侧面鼻头下垂的，然后大鼻头蒜头鼻的可以来试一试\n眼妆今天画的是一个美拉德风的眼妆，整体是金棕色也很喜欢\n如果有姐妹们喜欢，我下次可以出眼妆的教程'),(14,'5','日常','asadasd.jpg,dasdswdd.jpg,saxdasdqw.jpg','带着小猫眼线妆教水灵灵地来了','之前的笔记下面很多姐妹求的眼妆妆教来啦，已经尽力还原了！\n这个小猫眼妆的眼线是重点，精髓在于拉长眼尾+下睫毛，给宝宝老师们提供一些妆容灵感，可以结合自己的眼型尝试，不一定照搬，适合自己的才是最好看滴！'),(15,'5','日常','sadasd.jpg,cdasdcas.jpg,dasdas.jpg,sadasdas.jpg,asxasdxas.jpg,dsadasda.jpg,dasdxasxa.jpg','超适合新手的6种眼妆！网感眼妆分享～','小宝们最喜欢哪个眼妆捏！'),(16,'5','日常','axdasdxas.jpg,fasdasdxa.jpg,dasdasa.jpg,saxASXA.jpg,dsadawew.jpg,daxasxdas.jpg','赵露思贵气千金妆✨精致大气！','快来试试露思的贵气千金妆～\n很适合日常通勤画\nhin精致，贵气感满满✨'),(17,'6','全妆','dcasdxas.jpg,asxas.jpg,edasdasxa.jpg,swaxasxas.jpg,dasaxasxa.jpg','普通人也能画的清透上镜妆 附眼妆教程！','这个妆整体是偏日常出行的 所以整个配色都是一个基础的色调 ?选的就是自然放大的 水灵灵的 实况也很自然这个妆 最后有素颜给姐妹们参考'),(18,'6','全妆','dsadxasx.jpg,dsdcasxas.jpg,dasxasd.jpg,asdasd.jpg,sadasdcde.jpg,dxasxas.jpg,asdxaswdw.jpg','方圆脸爆改换头！巨上镜?‍⬛ins甜酷egirl妆','眼妆一整个大胆住，漫画感贼强！\nw型腮红是方圆脸也可以轻松驾驭\n圆钝小翘鼻+厚唇，欧美感拉满～'),(19,'6','全妆','saxasd.jpg,dcsdse.jpg,fdeadxa.jpg,dasasdw.jpg,dadasxas.jpg','高级低饱和｜通勤妆教程','低饱和色系的妆容带一点闪能画的场合数不过来咯！开学报道早课上班～而且拍照也高级喔'),(20,'6','全妆','saasdasw.jpg,saxdasdw.jpg,casdew.jpg,csddcwa.jpg,saadsz.jpg,casxsads.jpg,sadweas.jpg','普通人画痞幼网感妆容❗️附详细教程❗️','我嘞个豆痞幼这个妆尊嘟米到我了！\n夸张手法也泰显眼大啦～\n普通人也能变身doll感洋娃娃\n详细画法附图图啦✨'),(21,'7','御姐妆容','dxsxscsd.jpg,dasdasdw.jpg,dasdqed.jpg,esacasef.jpg,dsacsafc.jpg,dsdcdrrfzscs.jpg,fcdcfderfed.jpg,sdcsdeteed.jpg','肿泡眼天菜妆容！！自然野性狐狸眼好有气质！','改善眼型效果立竿见影！！'),(22,'7','御姐妆容','vdscscda.jpg,fdscsdcd.jpg,dscasdcdd.jpg,rfsdcasdas.jpg','这个妆好飒……谁懂?','重生拿回属于我的一切！气场up画完被自己冷到～清冷里面带些酷酷的feel 亮片又增加了一丢丢氛围感'),(23,'7','御姐妆容','dsadasxdsa.jpg,fdssfe.jpg,casdwd.jpg,fdasasedw.jpg,dsadasd.jpg,csdads.jpg,cdsdsed.jpg','深邃爆闪眼妆｜附眼妆画法保姆级详细教程','姐妹们！！今天这个甜辣爆闪眼妆深得我心！！\n画完直照镜子夸自己好看的程度\n有姐妹没画过甜辣眼妆我真的会伤心的！'),(24,'7','御姐妆容','sxasdcsdc.jpg,fdscasdas.jpg,fdscsdc.jpg','卸了妆大家都一样','伊达柚子仿妆'),(32,'1','淡妆新手','74124c6a8e357a017088904a49a2e698.png,7d64c7690dc4d78b78562d3ec8d651fb.png','89','65'),(33,'1','淡妆新手','3ddafc3197bd1724fc3ed098b504a1a0.png,4f121cb8ecd32bd5095930e22b217c16.png,','89','65'),(34,'3','日系','9a53e684f6b873b56450157b1721d1e8.png,253f5644a9cce3c436cb0b894b56a81d.png,5de51f22d6544caaf6fc9e54ccc1e714.png,','123456','123456'),(35,'1','淡妆新手','ae5a771b9d6a4dc47447e11617593088.png,8b8c58c73e9f794ba30ef60ac5bebc4e.png,','123','123'),(36,'1','淡妆新手','767b6169432917e7930aac6fa11a0e49.png,18952923b364a84b794a6ee359bbf37c.png,','1111','1111');
/*!40000 ALTER TABLE `m_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `m_hzplist`
--

DROP TABLE IF EXISTS `m_hzplist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `m_hzplist` (
  `id` int NOT NULL AUTO_INCREMENT,
  `typeid` int DEFAULT NULL,
  `type` varchar(455) DEFAULT NULL,
  `images` text,
  `name` varchar(455) DEFAULT NULL,
  `price` varchar(455) DEFAULT NULL,
  `Plant` varchar(455) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='化妆品列表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m_hzplist`
--

LOCK TABLES `m_hzplist` WRITE;
/*!40000 ALTER TABLE `m_hzplist` DISABLE KEYS */;
INSERT INTO `m_hzplist` VALUES (1,1,'粉底液','dsacascas.jpg','3.0升级版/卡姿兰粉底液小奶猫夜猫持久不脱妆遮瑕干油皮官方旗舰','89','6000'),(2,1,'粉底液','3.jpg','【立即加购】彩棠TIMAGE小圆管遮瑕持妆粉底液混合肌持久控油','225','7950'),(3,1,'粉底液','4.jpg','SOCORSKIN/修可芙粉底液粉霜养肤持久不脱妆干皮遮瑕持妆水润保湿','136','7888'),(4,1,'粉底液','5.jpg','雅诗兰黛DW持妆粉底液沁水持妆粉底轻薄服帖遮瑕控油保湿持久正品','155','6666'),(5,2,'气垫','6.jpg','【K总推荐】SOCORSKIN/修可芙气垫粉底bb霜遮瑕持久不脱妆油皮女','125','9877'),(6,2,'气垫','7.jpg','mistine蜜丝婷暹罗迷虹气垫BB霜遮瑕保湿持妆不易暗沉女混油控油','158','5666'),(7,2,'气垫','8.jpg','mistine蜜丝婷金气垫BB霜粉底液遮瑕保湿持久混合油干皮不易脱妆','99','7888'),(8,3,'眼影','10.jpg','菲鹿儿缎光八色眼影盘大地色哑光彩妆2024新款日常淡妆旗舰店正品','68.9','80000'),(9,3,'眼影','9.jpg','Judydoll橘朵七巧板玩趣眼影盘大地色腮红高光修容原木盘限定新手','31.05','12356'),(10,3,'眼影','11.jpg','gogotales戈戈舞金箔巧克力眼影盘603 613初学者哑光珠大地色学生','99','17777'),(11,3,'眼影','12.jpg','卡姿兰十色眼影综合盘24新款哑光大地色日常淡妆三合一眼影盘','199','9999'),(12,3,'眼影','13.jpg','【彩妆礼物】3CE九宫格 哑光大地色灰粉色新手眼影橘棕盘女礼物','79.8','29987'),(13,4,'口红','14.jpg','卡姿兰口红女不掉色不沾杯大牌唇膏教师节礼盒装素颜淡妆官方正品','89','12888'),(14,4,'口红','15.jpg','卡姿兰口红雾吻口红唇釉豆沙裸色系素颜显白哑光不易沾杯掉色大牌','99','9999'),(15,4,'口红','16.jpg','YSL圣罗兰黑管水光唇釉镜面漆光新色416/440/610官方正品礼盒装女','203','7820'),(16,5,'眼线笔','17.jpg','【买2减10】小奥汀眼线液笔防水不晕持妆绚彩玩色下睫毛极细官方','59','10000'),(17,5,'眼线笔','18.jpg','kissme眼线液笔 防水不易晕染持久新手胶笔膏卧蚕笔kiss me奇士美','73','6565'),(18,5,'眼线笔','19.jpg','眼线笔液胶不晕染防水防汗持久不脱色速干流畅卧蚕笔极细初学正品','42.63','7878'),(19,6,'遮瑕','20.jpg','\r 【立即抢购】彩棠TIMAGE妆前乳隔离霜保湿控油服帖不卡隐匿毛孔\r ','169','12000'),(20,6,'遮瑕','21.jpg','DPU三色遮瑕膏遮暇盘液笔黑眼圈眼袋遮盖斑点脸部痘印化妆师专用','49','17842');
/*!40000 ALTER TABLE `m_hzplist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `m_hzptype`
--

DROP TABLE IF EXISTS `m_hzptype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `m_hzptype` (
  `id` int NOT NULL AUTO_INCREMENT,
  `typeid` int DEFAULT NULL,
  `name` varchar(455) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='化妆品分类表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m_hzptype`
--

LOCK TABLES `m_hzptype` WRITE;
/*!40000 ALTER TABLE `m_hzptype` DISABLE KEYS */;
INSERT INTO `m_hzptype` VALUES (1,1,'粉底液'),(2,2,'气垫'),(3,3,'眼影'),(4,4,'口红'),(5,5,'眼线笔'),(6,6,'遮瑕');
/*!40000 ALTER TABLE `m_hzptype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `m_image`
--

DROP TABLE IF EXISTS `m_image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `m_image` (
  `id` int NOT NULL,
  `image` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='公共轮播图';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m_image`
--

LOCK TABLES `m_image` WRITE;
/*!40000 ALTER TABLE `m_image` DISABLE KEYS */;
INSERT INTO `m_image` VALUES (1,'acasdcacs.jpg'),(2,'72c956bb1cb.jpg'),(3,'sxdasdasdas.jpg'),(4,'sadasdasda.jpg'),(5,'vsdvsdvdsv.jpg'),(6,'vsdvsdvsd.jpg');
/*!40000 ALTER TABLE `m_image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `m_like`
--

DROP TABLE IF EXISTS `m_like`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `m_like` (
  `id` int NOT NULL AUTO_INCREMENT,
  `likeid` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='喜欢列表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m_like`
--

LOCK TABLES `m_like` WRITE;
/*!40000 ALTER TABLE `m_like` DISABLE KEYS */;
INSERT INTO `m_like` VALUES (23,2,13),(24,3,13),(27,3,14),(28,6,14),(32,5,15),(34,1,15),(36,5,16);
/*!40000 ALTER TABLE `m_like` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `m_list`
--

DROP TABLE IF EXISTS `m_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `m_list` (
  `id` int NOT NULL AUTO_INCREMENT,
  `typeid` int DEFAULT NULL,
  `type` varchar(455) DEFAULT NULL,
  `images` text,
  `name` varchar(455) DEFAULT NULL,
  `line` varchar(455) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='列表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m_list`
--

LOCK TABLES `m_list` WRITE;
/*!40000 ALTER TABLE `m_list` DISABLE KEYS */;
INSERT INTO `m_list` VALUES (1,1,'淡妆新手','dascascad.jpg','\n为啥没人画苍井优这种氧气妆了？真的好灵动','之前发优酱这篇的时候就有好多老婆们很好奇这样的卧蚕是怎么画出来的～'),(2,1,'淡妆新手','xascasdvcdsv.jpg','新手小白一看就会的淡妆！','手把手教学，妆容分享'),(3,1,'淡妆新手','asdasdef.jpg','这才是普通人的日常淡妆，新手学起来！','新手化妆'),(4,1,'淡妆新手','ddscsdvcer.jpg','圆脸~新手万能淡妆公式','圆脸妆容'),(5,2,'韩系妆容','cdscsdvcsdvsd.jpg','韩系女高妆教程从新手到大师的秘诀！','韩系女高妆的特点，此现实中韩系妆容受欢迎的程度很高，韩系女高妆的特点是什么'),(6,2,'韩系妆容','cdscsdcsd.jpg','古早韩妆！','古早韩妆！无假睫毛+粗眼线+水光感太灵噜。?调色：'),(7,2,'韩系妆容','xcsdcsdcs.jpg','中式狐狸眼 韩系兔兔眼｜新手眼线教程！','不同的眼线可以改变我们的眼型！小宝们更喜欢哪个眼线捏！'),(8,3,'日系','dscsdvsdv.jpg','新中式狐狸眼 日系狗狗眼｜新手眼妆教程！','两种好不一样的风格～小宝们更喜欢哪个捏～'),(9,3,'日系','dscxascsc.jpg','为什么现在都没人画刘亦菲这种妆了？？好娇媚','菲菲宝宝的妆能画10086遍！！'),(10,3,'日系','dsscdsvcwdvw.jpg','妆面记录｜秋冬日杂氧气感','今天的元气感日系妆喜欢嘛～'),(11,4,'亚裔','ddscsdcsd.jpg','内双塌鼻梁的ins女高亚裔妆容','拽拽的 辣辣的'),(12,4,'亚裔','csdcsdcws.jpg','千禧烟熏妆｜妆容教程','#辣妹妆容 #亚裔辣妹妆 '),(13,4,'亚裔','sxaxcswe.jpg','塌鼻梁来学亚裔感详细修鼻?教程❗️巨立体！','#鼻子修容 #教程'),(14,5,'日常','xascsacvd.jpg','带着小猫眼线妆教水灵灵地来了','带着小猫眼线妆教水灵灵地来了'),(15,5,'日常','xsaxascxasc.jpg','超适合新手的6种眼妆！网感眼妆分享～','小宝们最喜欢哪个眼妆捏！'),(16,5,'日常','sdxascsaca.jpg','赵露思贵气千金妆✨精致大气！','快来试试露思的贵气千金妆～'),(17,6,'全妆','saxascav.jpg','普通人也能画的清透上镜妆 附眼妆教程！','这个妆整体是偏日常出行的'),(18,6,'全妆','xascwvwdv.jpg','方圆脸爆改换头！巨上镜?‍⬛ins甜酷egirl妆','眼妆一整个大胆住，漫画感贼强！'),(19,6,'全妆','dscscsdvwv.jpg','高级低饱和｜通勤妆教程','低饱和色系的妆容带一点闪能画的场合数不过来咯！'),(20,6,'全妆','xscadvwvwd.jpg','普通人画痞幼网感妆容❗️附详细教程❗️','#普通人化妆 #妆前妆后'),(21,7,'御姐妆容','dcscadv.jpg','肿泡眼天菜妆容！！自然野性狐狸眼好有气质！','改善眼型效果立竿见影！！'),(22,7,'御姐妆容','xascascadv.jpg','这个妆好飒……谁懂?','#今日妆容 #狐狸眼#妆容教程'),(23,7,'御姐妆容','cxscsdcsd.jpg','深邃爆闪眼妆｜附眼妆画法保姆级详细教程','姐妹们！今天带给大家的眼妆也是这种深邃感拉满的!'),(24,7,'御姐妆容','dxascscs.jpg','卸了妆大家都一样',' #反差 #伊达柚子仿妆'),(36,1,'淡妆新手','767b6169432917e7930aac6fa11a0e49.png,18952923b364a84b794a6ee359bbf37c.png,','1111','1111');
/*!40000 ALTER TABLE `m_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `m_shoppping`
--

DROP TABLE IF EXISTS `m_shoppping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `m_shoppping` (
  `id` int NOT NULL AUTO_INCREMENT,
  `shopid` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='购物车';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m_shoppping`
--

LOCK TABLES `m_shoppping` WRITE;
/*!40000 ALTER TABLE `m_shoppping` DISABLE KEYS */;
/*!40000 ALTER TABLE `m_shoppping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `m_type`
--

DROP TABLE IF EXISTS `m_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `m_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `typeid` int DEFAULT NULL,
  `icon` text,
  `type` varchar(455) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='分类';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m_type`
--

LOCK TABLES `m_type` WRITE;
/*!40000 ALTER TABLE `m_type` DISABLE KEYS */;
INSERT INTO `m_type` VALUES (1,1,'xscsfcsdfsd.png','淡妆新手'),(2,2,'xscsdvsdv.png','韩系妆容'),(3,3,'dfdfwgw.png','日系'),(4,4,'ffsdvsfbdhe.png','亚裔'),(5,5,'dsvsdvgre.png','日常'),(6,6,'dcadvwrgwr.png','全妆'),(7,7,NULL,'御姐妆容'),(8,NULL,NULL,'全部');
/*!40000 ALTER TABLE `m_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `m_user`
--

DROP TABLE IF EXISTS `m_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `m_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(455) DEFAULT NULL,
  `password` varchar(455) DEFAULT NULL,
  `nickname` varchar(455) DEFAULT NULL,
  `phone` varchar(455) DEFAULT NULL,
  `sex` varchar(455) DEFAULT NULL,
  `avatar` text,
  `profile` varchar(455) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m_user`
--

LOCK TABLES `m_user` WRITE;
/*!40000 ALTER TABLE `m_user` DISABLE KEYS */;
INSERT INTO `m_user` VALUES (1,'admin','$2a$10$viHUjYanp9m.HLvh03fT4.bAHiBUuBlQVAgWVrfb77rUitgHFtee.','231','15616532','男','3104908d45e4ef269c9590dc0075442f.jpg','大家好哦啊'),(16,'test','$2a$10$ZdhkTbGx0ZbXP6a6IFy/eehfLHobnzsxVlfq7lHLd7WLwjoL1xI/i','456','123456','男','f63b802bf57d7b42ad4f5f83866732eb.png','大家好');
/*!40000 ALTER TABLE `m_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'makeup'
--

--
-- Dumping routines for database 'makeup'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-10-11 19:47:37
