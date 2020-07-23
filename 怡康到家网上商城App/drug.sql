-- phpMyAdmin SQL Dump
-- version 4.8.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: 2020-03-11 17:19:43
-- 服务器版本： 10.1.34-MariaDB
-- PHP Version: 5.6.37

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `drug`
--

-- --------------------------------------------------------

--
-- 表的结构 `gouwu`
--

CREATE TABLE `gouwu` (
  `src` varchar(10000) NOT NULL COMMENT '商品图片',
  `name` varchar(1000) NOT NULL COMMENT '商品名称',
  `price` varchar(100) NOT NULL COMMENT '商品价格',
  `number` varchar(100) NOT NULL COMMENT '商品数量',
  `tel` varchar(100) NOT NULL COMMENT '用户',
  `id` varchar(50) NOT NULL COMMENT '商品id',
  `text` varchar(5000) NOT NULL COMMENT '商品介绍'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='购物车';

--
-- 转存表中的数据 `gouwu`
--

INSERT INTO `gouwu` (`src`, `name`, `price`, `number`, `tel`, `id`, `text`) VALUES
('http://image.360kad.com/group2/M00/25/80/CgAgFVo4evWAIFbKAAG5jfb3vCk294.jpg_180x180.jpg', '兰州佛慈 阿胶铁盒', '480.00', '1', '17730662313', '1583925184271', '补血滋阴，润燥止血。用于血虚面色萎黄、眩晕心悸、肌萎无力、心烦不眠、虚风内动、肺燥咳嗽、劳嗽咳血等。');

-- --------------------------------------------------------

--
-- 表的结构 `home`
--

CREATE TABLE `home` (
  `id` varchar(100) NOT NULL COMMENT 'ID账号',
  `name` varchar(100) NOT NULL COMMENT '商品名称',
  `src` mediumtext NOT NULL COMMENT '图片',
  `number` varchar(100) NOT NULL COMMENT '商品数量',
  `price` varchar(100) NOT NULL COMMENT '商品价格',
  `text` mediumtext NOT NULL COMMENT '商品介绍',
  `type` varchar(100) NOT NULL COMMENT '商品类型'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品表';

--
-- 转存表中的数据 `home`
--

INSERT INTO `home` (`id`, `name`, `src`, `number`, `price`, `text`, `type`) VALUES
('1583463333', '0', 'https://image.360kad.com/group2/M00/F0/43/CgAgFF5hnvaAYIbUAAEzxdChJt8708.jpg', '0', '0', '0', 'swiper'),
('1583463370', '0', 'https://image.360kad.com/group2/M00/EF/09/CgAgFF5Y4DWAC3F9AAF0qHNEa2k910.jpg', '0', '0', '0', 'swiper'),
('1583463431', '0', 'https://image.360kad.com/group2/M00/F0/30/CgAgFV5grCGAXfz3AAG1eFnaq8Y199.jpg', '0', '0', '0', 'swiper'),
('1583463607', '领劵', 'http://image.360kad.com/group2/M00/D2/FA/CgAgFF2xBaCAWRGFAAAfkF2KnQY171.png', '0', '0', '0', 'banner'),
('1583463629', '附近门店', 'http://image.360kad.com/group2/M00/D2/FA/CgAgFV2xBdSACmw6AAAmmktnd_I775.png', '0', '0', '0', 'banner'),
('1583463666', '24小时药店', 'https://image.360kad.com/group2/M00/E3/BF/CgAgFV3p6a2AHgOmAAAlEnhRCbE663.png', '0', '0', '0', 'banner'),
('1583463701', '防疫商品', 'https://image.360kad.com/group2/M00/EC/AE/CgAgFV5HP9SAFlf5AAAhJXFxBAM205.png', '0', '0', '0', 'banner'),
('1583463744', '每日蔬鲜', 'http://image.360kad.com/group2/M00/D2/FA/CgAgFF2xBViAXjgtAAAe87Ke49A017.png', '0', '0', '0', 'banner'),
('1583464177', '感冒发烧', 'http://image.360kad.com/group2/M00/D2/FA/CgAgFF2xBcKAQk0ZAAAfLvmCM64267.png', '0', '0', '0', 'banner1'),
('1583464194', '儿童用药', 'http://image.360kad.com/group2/M00/D2/FA/CgAgFF2xBcKAQk0ZAAAfLvmCM64267.png', '0', '0', '0', 'banner1'),
('1583464210', '妇科用药', 'http://image.360kad.com/group2/M00/D2/FA/CgAgFF2xBcKAQk0ZAAAfLvmCM64267.png', '0', '0', '0', 'banner1'),
('1583464224', '幸福生活', 'http://image.360kad.com/group2/M00/D2/FA/CgAgFF2xBcKAQk0ZAAAfLvmCM64267.png', '0', '0', '0', 'banner1'),
('1583464237', '理疗', 'http://image.360kad.com/group2/M00/D2/FA/CgAgFF2xBcKAQk0ZAAAfLvmCM64267.png', '0', '0', '0', 'banner1'),
('1583464254', '五官科', 'http://image.360kad.com/group2/M00/D2/FA/CgAgFF2xBcKAQk0ZAAAfLvmCM64267.png', '0', '0', '0', 'banner1'),
('1583464270', '糖友用品', 'http://image.360kad.com/group2/M00/D2/FA/CgAgFF2xBcKAQk0ZAAAfLvmCM64267.png', '0', '0', '0', 'banner1'),
('1583464295', '医疗器械', 'http://image.360kad.com/group2/M00/D2/FA/CgAgFF2xBcKAQk0ZAAAfLvmCM64267.png', '0', '0', '0', 'banner1'),
('1583464310', '营养保健', 'http://image.360kad.com/group2/M00/D2/FA/CgAgFF2xBcKAQk0ZAAAfLvmCM64267.png', '0', '0', '0', 'banner1'),
('1583464331', '新特药', 'http://image.360kad.com/group2/M00/D2/FA/CgAgFF2xBcKAQk0ZAAAfLvmCM64267.png', '0', '0', '0', 'banner1'),
('1583488080', '三九感冒灵颗粒', 'http://image.360kad.com/group1/M00/1D/D6/CgAgEVapv0uAZSJJAAAgAJWAbuA94.jpeg', '100', '12.74', '感冒引起的头痛、发热、鼻塞、流涕、咽喉疼痛，家庭常备治感冒		', 'scoll'),
('1583488142', '大山楂丸', 'http://image.360kad.com/group2/M00/90/E7/CgAgFVuGDbKADnGYAAHHTFHh-LU180.jpg_180x180.jpg', '100', '1', '开胃消食。用于食积内停所致的食欲不振，消化不良，脘腹胀闷。', 'scoll'),
('1583488203', '板蓝根颗粒', 'http://image.360kad.com/group2/M00/3B/97/CgAgFVqWCCSAICwXAAHB25_Ldpg692.jpg_180x180.jpg', '100', '12.54', '消炎解毒。用于咽炎，疮疖肿痛。', 'scoll'),
('1583488260', '肺宁颗粒', 'http://image.360kad.com/group1/M00/7F/26/CgAgEVhvEPGAIm7YAAHfJESOjz4170.jpg_180x180.jpg', '100', '18', '用于肺内感染   慢性支气管炎   喘息性支气管炎  急性呼吸道感染等   ', 'scoll'),
('1583488324', '养生堂牌天然维生素E软胶囊', 'http://image.360kad.com/group2/M00/0B/D3/CgAgFVnciW6ADzzKAAGQbJUt6AA839.jpg_180x180.jpg', '100', '168', '美容（祛黄褐斑），延缓衰老。', 'scoll'),
('1583488373', '天然维生素C咀嚼片', 'http://image.360kad.com/group1/M00/3D/D2/CgAgEVeItzGAAlOEAAGRnlAlRog436.jpg_180x180.jpg', '100', '168', '增强免疫力、抗氧化！', 'scoll'),
('1583488424', '詹氏百花蜂蜜', 'https://image.360kad.com/group2/M00/EA/93/CgAgFF4iw5uAApW8AAL6qQ2LC48156.jpg_180x180.jpg', '100', '16', '天然好蜂蜜', 'scoll'),
('1583722451', '汤臣倍健蛋白粉', 'http://image.360kad.com/group2/M00/1B/40/CgAgFVoThI-AZ3-pAAFRP5mhqXQ536.jpg_180x180.jpg', '100', '398.00', '增强免疫力补充蛋白质。', 'guess'),
('1583722517', '来益牌叶黄素咀嚼片	', 'http://image.360kad.com/group1/M00/7C/D4/CgAgEFhk4oSAKqPMAAHDhEu-3f0564.jpg_180x180.jpg', '100', '134.00', '儿童成人 护眼 眼疲劳 吸收好', 'guess'),
('1583722578', '复方阿胶浆 	', 'http://image.360kad.com/group2/M00/35/7A/CgAgFVpxioCAdE1tAAF0JkkEcvk444.jpg_180x180.jpg', '100', '498.00', '补气养血。用于气血两虚，头晕目眩，心悸失眠，食欲不振及贫血。 ', 'guess'),
('1583722627', '兰州佛慈 阿胶铁盒', 'http://image.360kad.com/group2/M00/25/80/CgAgFVo4evWAIFbKAAG5jfb3vCk294.jpg_180x180.jpg', '100', '480.00', '补血滋阴，润燥止血。用于血虚面色萎黄、眩晕心悸、肌萎无力、心烦不眠、虚风内动、肺燥咳嗽、劳嗽咳血等。', 'guess'),
('1583722731', '阿法林润康胶囊片剂', 'https://image.360kad.com/group2/M00/E8/49/CgAgFF4QiBeAOthHAALV7w8SQ_E261.jpg_180x180.jpg', '100', '518.00', '本品具有补充α-亚麻酸及卵磷脂、多种维生素、微量元素的作用。', 'guess'),
('1583722775', '汇仁肾宝片	', 'http://image.360kad.com/group2/M00/8E/51/CgAgFFt-KjyAP7EbAAFa1-VxzZM565.jpg_180x180.jpg', '100', '322.00', '调和阴阳，温阳补肾，扶正固本。用于腰腿酸痛，精神不振，夜尿频多，畏寒怕冷，妇女白带清稀。', 'guess'),
('1583722826', '排毒养颜胶囊', 'http://image.360kad.com/group2/M00/BA/4C/CgAgFV0r1H6AV-IFAAKAxzInfg8186.jpg_180x180.jpg', '100', '159.00', '益气活血，通便排毒。用于气虚血瘀，热毒内盛所致便秘、痤疮、颜面色斑。 ', 'guess'),
('1583722919', '养生堂牌 天然维生素C咀嚼片', 'http://image.360kad.com/group2/M00/A0/13/CgAgFFwRwueAd_X5AAHN1OQo8b0693.jpg_180x180.jpg', '100', '168.00', '增强免疫力、抗氧化！', 'guess'),
('1583832934', '新特药', 'http://www.yaoking.cn/wap_themes/yaoking_new/images/vouchers.png', '0', '0', '0', 'callbanner'),
('1583832962', '母婴专场', 'http://www.yaoking.cn/wap_themes/yaoking_new/images/index_btn_weeklyspecial.png', '0', '0', '0', 'callbanner'),
('1583833004', '季节用药', 'http://www.yaoking.cn/wap_themes/yaoking_new/images/home-icon5.png', '0', '0', '0', 'callbanner'),
('1583833037', '风湿骨病', 'http://www.yaoking.cn/wap_themes/yaoking_new/images/index_btn_recommend.png', '0', '0', '0', 'callbanner'),
('1583833721', '0', 'https://image.360kad.com/group2/M00/F1/32/CgAgFF5nOliAc2THAAE26oxFwzw925.jpg', '0', '0', '0', 'callswiper'),
('1583833818', '0', 'https://image.360kad.com/group2/M00/F1/17/CgAgFV5m7I6AUdsgAAF9VJdou0o004.jpg', '0', '0', '0', 'callswiper'),
('1583833871', '0', 'http://img1.yaoking.cn//d4/71/18/41334af381be56b812e22dbfe20ee99c773.jpg?1581661103#w', '0', '0', '0', 'callswiper'),
('1583833903', '0', 'http://img1.yaoking.cn//44/ba/c3/c6802c270400de465e25ccfb77a7a3ee8b1.png?1581168388#w', '0', '0', '0', 'callswiper'),
('1583833923', '0', 'http://img1.yaoking.cn//3d/7b/cf/c23de209321750788e1af9c3f13f9903f07.png?1573012950#w', '0', '0', '0', 'callswiper'),
('1583833948', '0', 'http://img1.yaoking.cn//a5/55/c4/4b32bf93970a7bbf31b3b8d2c5511b38876.png?1568778276#w', '0', '0', '0', 'callswiper'),
('1583833968', '0', 'http://img1.yaoking.cn//7f/ba/b0/0a0d415a2e02acc0e765d749422af7928fc.png?1583833244#w', '0', '0', '0', 'callswiper'),
('1583833993', '0', 'http://img1.yaoking.cn//f6/a3/fb/3a88d29a754b3edb22dde2458a15eb2a45f.png?1563453913#w', '0', '0', '0', 'callswiper'),
('1583834880', '轻松找药', 'https://p3.maiyaole.com/img/mobile/201810/1541953163405143.png', '0', '0', '0', 'callbanner1'),
('1583834918', '男性', 'https://p1.maiyaole.com/img/mobile/201810/1541953174961144.png', '0', '0', '0', 'callbanner1'),
('1583834954', '女性', 'https://p2.maiyaole.com/img/mobile/201810/1541953179796145.png', '0', '0', '0', 'callbanner1'),
('1583834982', '慢病', 'https://p2.maiyaole.com/img/mobile/20200/1580455286739101.png', '0', '0', '0', 'callbanner1'),
('1583835027', '问医生', 'https://p3.maiyaole.com/img/mobile/201810/1541953187754147.png', '0', '0', '0', 'callbanner1'),
('1583835057', '免费问诊', 'https://p1.maiyaole.com/img/mobile/20200/1580455302786102.png', '0', '0', '0', 'callbanner1'),
('1583835090', '疫情动态', 'https://p1.maiyaole.com/img/mobile/20200/1580455325680103.png', '0', '0', '0', 'callbanner1'),
('1583835115', '防护知识', 'https://p3.maiyaole.com/img/mobile/20200/1580455350069108.png', '0', '0', '0', 'callbanner1'),
('1583835149', '维生素钙', 'https://p3.maiyaole.com/img/mobile/20200/1580455377619110.png', '0', '0', '0', 'callbanner1'),
('1583835174', '上传处方', 'https://p3.maiyaole.com/img/mobile/20200/1580455391595112.png', '0', '0', '0', 'callbanner1'),
('1583895074', '汇仁 肾宝片 0.7g*126片', 'https://p1.maiyaole.com/img/item/202003/09/380_20200309111259828.jpg', '100', '322.00', '把肾透支的补起来。调和阴阳，温阳补肾。用于腰腿酸痛，精神不振，夜尿频多，畏寒怕冷。     ', 'cscoll'),
('1583895130', '东阿 阿胶 500g', 'https://p4.maiyaole.com/img/item/201909/18/org_20190918111804294.jpg', '100', '1888.00', '正宗东阿阿胶，专注气血问题，补血养血，滋阴润燥。用于血虚萎黄，眩晕心悸，心烦不眠，肺燥咳嗽。     ', 'cscoll'),
('1583895182', '福牌 阿胶 250g', 'https://p4.maiyaole.com/img/item/202003/05/org_202003051126310.jpg', '100', '358.00', '补血滋阴,润燥、止血。用于血虚萎黄,眩晕心悸,心烦不眠,肺燥咳嗽《效期2020年7月30日介意者慎拍》', 'cscoll'),
('1583895244', '同仁堂 金匮肾气丸 360丸', 'https://p2.maiyaole.com/img/item/201802/24/380_20180224104634828.jpg', '100', '13.5', '温补肾阳，化气行水。用于肾虚水肿，腰膝酸软，小便不利，畏寒肢冷。', 'cscoll'),
('1583895314', '济民可信 金水宝胶囊 0.33g*63粒', 'https://p2.maiyaole.com/img/50090/50090687/330_330.jpg?a=340618566', '100', '42.5', '     补益肺肾、秘精益气。用于肺肾两虚，精气不足，久咳虚喘，神疲乏力，不寐健忘，腰膝痠软，月经不调，阳痿早泄；慢性支气管炎     ', 'cscoll'),
('1583895383', '同仁堂 六味地黄丸 120丸(浓缩丸)', 'https://p2.maiyaole.com/img/item/201911/20/380_20191120171534278.jpg', '100', '9.9', '     补肾滋阴。用于肾阴亏损，头晕耳鸣，腰膝酸软，骨蒸潮热，盗汗遗精【新旧包装随机发货】     ', 'cscoll'),
('1583895435', '东阿阿胶 复方阿胶浆礼盒 20ml*48支 无蔗糖', 'https://p3.maiyaole.com/img/item/202003/10/380_20200310132704437.jpg', '100', '275.00', '     气血两虚，头晕目眩，心悸失眠，食欲不振及贫血。     ', 'cscoll'),
('1583895496', '敖东 安神补脑液 10mL*40支', 'https://p4.maiyaole.com/img/item/201708/24/380_20170824160313265.jpg', '100', '72.5', '     生精补髓，益气养血，强脑安神。用于肾精不足、气血两亏所致的头晕、乏力、健忘、失眠；神经衰弱症见上述证候者。      ', 'cscoll'),
('1583897396', ' 							左洛复 盐酸舍曲林片 50mg*14片 						', 'https://p2.maiyaole.com/img/item/201808/14/200_20180814171027137.jpg', '100', '83.00', '     舍曲林用于治疗抑郁症的相关症状，包括伴随焦虑、有或无躁狂史的抑郁症。疗效满意后，继续服用舍曲林可有效地防止抑郁症的复发和再发。 舍曲林也用于治疗强迫症。疗效满意后，继续服用舍曲林可有效地防止强迫症初始症状的复发。     ', 'scoll'),
('1583897454', ' 							来士普 草酸艾司西酞普兰片 10mg*7片 						', 'https://p4.maiyaole.com/img/item/201909/18/200_201909181749505.jpg', '100', '93.00', '     治疗抑郁症；治疗伴有或不伴有广场恐怖症的惊恐障碍。     ', 'scoll'),
('1583897519', ' 							怡诺思 盐酸文拉法辛缓释胶囊 75mg*14粒 						', 'https://p2.maiyaole.com/img/1250/1250856/120_120.jpg?a=388933448', '100', '95.00', '     本品适用于各种类型抑郁症(包括伴有焦虑的抑郁症)及广泛性焦虑症,详见说明书。     ', 'scoll'),
('1583897589', '络活喜 苯磺酸氨氯地平片 5mg*7片', 'https://p4.maiyaole.com/img/item/201804/12/380_20180412142806837.jpg?x-oss-process=image/quality,Q_70', '100', '26.00', '     1.本品适用于高血压的治疗。可单独应用或与其他抗高血压药物联合应用。2.冠心病（CAD）慢性稳定性心绞痛，本品适用于慢性稳定性心绞痛的对症治疗。可单独应用或与其他抗心绞痛药物联合应用。血管痉挛性心绞痛（Prinzmetal’s 或变异型心绞痛）。本品适用于确诊或可疑的血管痉挛性心绞痛的治疗。可单独应用也可与其他抗心绞痛药物联合应用。经血管造影证实的冠心病经血管造影证实为冠心病，但射血分数≥40％且无心衰的患者，本品可减少因心绞痛住院的风险以及降低冠状动脉重建术的风险。     ', 'scoll'),
('1583897634', '博路定 恩替卡韦片 0.5mg*7片', 'https://p4.maiyaole.com/img/item/201910/11/380_20191011150735127.jpg?x-oss-process=image/quality,Q_70', '100', '152.00', '     本品适用于病毒复制活跃，血清转氨酶ALT持续升高或肝脏组织学显示有活动性病变的慢性成人乙型肝炎的治疗。 也适用于治疗2岁至<18岁慢性HBV感染代偿性肝病的核苷初治儿童患者，有病毒复制活跃和血清ALT水平持续升高的证据或中度至重度炎症和/或纤维化的组织学证据。其具体使用方法参见[用法用量]。     ', 'scoll'),
('1583897696', '信必可都保 布地奈德福莫特罗粉吸入剂（Ⅱ） 160μg:4.5μg*60吸', 'https://p1.maiyaole.com/img/item/201612/08/380_2016120813201692.jpg?x-oss-process=image/quality,Q_70', '100', '235.00', '     1.哮喘：本品适用于需要联合应用吸入皮质激素和长效β2一受体激动剂的哮喘病人的常规治疗，吸入皮质激素和“按需”使用短效β2一受体激动剂不能很好地控制症状的患者，或应用吸入皮质激素和长效β2一受体激动剂，症状已得到良好控制的患者。                                                                                  2.慢性阻塞性肺病（COPD）：针对患有COPD(FEV1≤预计正常值的50%)和伴有病情反复发作恶化的患者进行对症治疗，这些患者尽管长期规范的使用长效的支气管扩张剂进行治疗，仍会出现明显的临床症状。     ', 'scoll'),
('1583897747', '舒利迭 沙美特罗替卡松粉吸入剂 50μg:250μg*60泡', 'https://p2.maiyaole.com/img/item/201808/10/380_20180810095423827.jpg?x-oss-process=image/quality,Q_70', '100', '197.00', '     舒利迭以联合用药形式（支气管扩张剂和吸入皮质激素），用于可逆性阻塞性气道疾病的常规治疗，包括成人和儿童哮喘。 这可包括：  1.接受有效维持剂量的长效β2-激动剂和吸入型皮激素治疗的患者。  2.目前使用吸入型皮质激素治疗但仍有症状的患者。  3.接受支气管扩张剂常规治疗但仍然需要吸入型皮质激素的患者。     ', 'scoll'),
('1583897808', '莫比可 美洛昔康片 7.5mg*7片', 'https://p3.maiyaole.com/img/201311/05/330_20131105101102606.jpg?x-oss-process=image/quality,Q_70', '100', '19.5', '     1.骨关节炎症状加重时的短期症状治疗。2.类风湿性关节炎和强直性脊柱炎的长期症状治疗。     ', 'scoll'),
('1583897883', '森福罗 盐酸普拉克索片 0.25mg*30片', 'https://p3.maiyaole.com/img/item/201907/01/380_20190701203919719.jpg?x-oss-process=image/quality,Q_70', '100', '179', '     本品被用来治疗特发性帕金森病的体征和症状，单独（无左旋多巴）或与左旋多巴联用。例如，在疾病后期左旋多巴的疗效逐渐减弱或者出现变化和波动时（剂末现象或“开关”波动），需要应用本品。     ', 'scoll'),
('1583897946', '咪多吡 盐酸司来吉兰片 5mg*100片', 'https://p1.maiyaole.com/img/201606/25/330_20160625135131788.jpg?x-oss-process=image/quality,Q_70', '100', '348.00', '     单用治疗早期帕金森病或与左旋多巴或与左旋多巴及外周多巴脱羧酶抑制剂合用。司来吉兰与左旋多巴合用特别适用于治疗运动波动例如由于大剂量左旋多巴治疗引起的剂末波动。     ', 'scoll'),
('1583898149', '祛风湿 活血止痛 风湿关节 肌肉痛、扭伤羚锐 壮骨麝香止痛膏 7cm*10cm*10贴', 'https://p1.maiyaole.com/img/item/201805/10/380_20180510174902808.jpg?x-oss-process=image/quality,Q_70', '100', '6.2', '     祛风湿，活血止痛。用于风湿关节、肌肉痛、扭伤。     ', 'scoll'),
('1583908367', ' 								养生堂牌 天然维生素C咀嚼片  【节后陆续发货】							', 'https://p2.maiyaole.com/img/item/202001/08/200_20200108092332534.jpg', '100', '168.00', '增强免疫力、抗氧化！', 'rib'),
('1583908437', ' 								汤臣倍健蛋白粉							', 'http://image.360kad.com/group2/M00/1B/40/CgAgFVoThI-AZ3-pAAFRP5mhqXQ536.jpg_180x180.jpg', '100', '298.00', '增强免疫力补充蛋白质。', 'rib'),
('1583908497', ' 								澳天力牌蛋白粉							', 'http://image.360kad.com/group2/M00/D2/FC/CgAgFV2xDyuAMYj2AAKD8HxseiU301.jpg_180x180.jpg', '100', '179.00', '采用非转基因大豆分离蛋白和进口浓缩乳清蛋白搭配', 'rib'),
('1583908542', ' 								果维康维生素C含片(蓝莓味)							', 'https://image.360kad.com/group2/M00/E5/E3/CgAgFF38XpeAUWVZAAKDQCnzn5Y653.jpg_180x180.jpg', '100', '45.00', '蓝莓味，莓补充维生素C ，无蔗糖。本品不能替代药物。', 'rib'),
('1583908591', ' 								果维康维生素C含片(青苹果味)							', 'http://image.360kad.com/group2/M00/A2/47/CgAgFFwyvXCAdXfpAAG59pV4Hks642.jpg_180x180.jpg', '100', '45.00', '补充维生素C', 'rib'),
('1583908635', ' 								果维康维生素C含片(无糖鲜橙味) 11474							', 'http://image.360kad.com/group2/M00/AA/B9/CgAgFFyRuCyAQ_jNAAG8ROXwSZM861.jpg_180x180.jpg', '100', '45.00', '补充维生素C多种维生素及锌、硒', 'rib'),
('1583908678', ' 								艾兰得维生素C含片（草莓味）							', 'http://image.360kad.com/group2/M00/93/81/CgAgFVuOS0yAdnRqAACp96P6tHM327.jpg_180x180.jpg', '100', '23.42', '补充维生素C', 'rib'),
('1583908722', ' 								艾兰得维生素C含片（桔子味）							', 'http://image.360kad.com/group2/M00/93/81/CgAgFVuOS0yAdnRqAACp96P6tHM327.jpg_180x180.jpg', '100', '23.42', '补充维生素C', 'rib'),
('1583910009', ' 								慢严舒柠好爽糖		（哈密瓜味）', 'http://image.360kad.com/group2/M00/1F/EE/CgAgFVok8o2AfegWAAGwCMnsefE969.jpg_180x180.jpg', '100', '19.5', '适用于用嗓过度、烟酒、熬夜、环境污染等原因引起的咽部有异物感、干燥刺痒、刷牙干呕的人群。', 'huxi'),
('1583910087', ' 								慢严舒柠好爽糖（鲜橙味）							', 'http://image.360kad.com/group2/M00/1F/ED/CgAgFVok8jGANwy1AAFTKzCRBZk449.jpg_180x180.jpg', '100', '19.5', '口感温和纯正，好吃不刺激肠胃。单粒独立包装，方便分享。', 'huxi'),
('1583910239', ' 								慢严舒柠好爽糖（薄荷味）							', 'http://image.360kad.com/group2/M00/1F/ED/CgAgFFok8eGAfA02AAG874fvKrE901.jpg_180x180.jpg', '100', '19.5', '清咽润喉，缓解咽喉不适。', 'huxi'),
('1583910287', ' 								慢严舒柠好爽糖（草莓味）						', 'http://image.360kad.com/group2/M00/1F/EE/CgAgFFok8miAIy0WAAFp0I-2U8I709.jpg_180x180.jpg', '100', '19.5', '清咽润喉', 'huxi'),
('1583910368', ' 								怀恩堂胖大海硬质糖果(铁盒）							', 'http://image.360kad.com/group2/M00/9B/78/CgAgFFvarieAETfMAAEuPV0VB4U125.jpg_180x180.jpg', '100', '6.9', '清咽润喉。', 'huxi'),
('1583910424', '乐天 补肺丸', 'http://image.360kad.com/group1/M00/7E/76/CgAgEFhsbKiAKDsdAAHD7VjzdNI154.jpg_180x180.jpg', '100', '298.00', '补肺益气，止咳平喘。用于肺气不足，气短喘咳，咳声低弱，干咳痰粘，咽干舌燥。', 'huxi'),
('1583910493', ' 								肺宁颗粒							', 'http://image.360kad.com/group2/M00/B3/32/CgAgFVzrP4iAcopWAAEp83kQGhs814.jpg_180x180.jpg', '100', '18.00', '用于肺内感染   慢性支气管炎   喘息性支气管炎  急性呼吸道感染等   ', 'huxi'),
('1583910561', '枇杷止咳颗粒', 'https://p1.maiyaole.com/img/item/201608/27/200_20160827160556803.jpg', '100', '13.2', '止咳祛痰。用于咳嗽及支气管炎咳嗽。', 'huxi'),
('1583911061', ' 								桂龙药膏（葛洪）							', 'http://image.360kad.com/group2/M00/68/48/CgAgFVsFJfmAYhRSAAG7XJBSFK4400.jpg_180x180.jpg', '100', '699.00', '祛风除湿，舒筋活络，温肾补血。用于风湿骨痛，慢性腰腿痛，肾阳不足及气血亏虚引起的贫血，失眠多梦，气短，心悸，多汗，厌食，腹胀，尿频', 'baojian'),
('1583911132', '阿胶 福牌', 'http://image.360kad.com/group2/M00/25/80/CgAgFVo4evWAIFbKAAG5jfb3vCk294.jpg_180x180.jpg', '100', '860.00', '补血滋阴，润燥止血。用于血虚面色萎黄、眩晕心悸、肌萎无力、心烦不眠、虚风内动、肺燥咳嗽、劳嗽咳血等。', 'baojian'),
('1583911209', ' 								福施福营养素补充剂软胶囊							', 'http://image.360kad.com/group1/M00/98/6E/CgAgEVjmELCAUSaeAAMCrmYaljQ828.jpg_180x180.jpg', '100', '228.00', '福施福营养素补充剂软胶囊 44g(30粒)  补充多种维生素及矿物质', 'baojian'),
('1583911258', ' 								摩美得气血和胶囊 							', 'http://image.360kad.com/group2/M00/4D/5A/CgAgFFrO1_2AeEyDAAHaXkFRRfg941.jpg_180x180.jpg', '100', '288.00', '疏肝理气 活血止痛，用于妇女月经过少、经期后错，行经不畅，经色黯红有血块、小腹疼痛。', 'baojian'),
('1583911315', ' 								奥利司他胶囊 （舒尔佳 ） 							', 'http://image.360kad.com/group2/M00/81/34/CgAgFVtNQZWASA-qAAGbZuofTt0612.jpg_180x180.jpg', '100', '246.00', '用于肥胖或体重超重患者', 'baojian'),
('1583911430', ' 								舒筋健腰丸 							', 'http://image.360kad.com/group2/M00/B9/B8/CgAgFF0j75iAHODwAAHzWnisZmY921.jpg_180x180.jpg', '100', '890.00', '补益肝肾，强健筋骨，驱风除湿，活络止痛。用于腰膝酸痛。', 'baojian');

-- --------------------------------------------------------

--
-- 表的结构 `site`
--

CREATE TABLE `site` (
  `id` varchar(100) NOT NULL,
  `tel` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `cell` varchar(100) NOT NULL,
  `address` varchar(100) NOT NULL,
  `city` varchar(100) NOT NULL,
  `sex` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='地址表';

--
-- 转存表中的数据 `site`
--

INSERT INTO `site` (`id`, `tel`, `name`, `cell`, `address`, `city`, `sex`) VALUES
('1583940718', '17730662313', '赵梦毓', '17730662313', '汉神购物广场', '北京市-市辖区-西城区', '');

-- --------------------------------------------------------

--
-- 表的结构 `user`
--

CREATE TABLE `user` (
  `id` varchar(100) NOT NULL COMMENT 'ID账号',
  `tel` varchar(100) NOT NULL COMMENT '用户',
  `pwo` varchar(100) NOT NULL COMMENT '密码'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户表';

--
-- 转存表中的数据 `user`
--

INSERT INTO `user` (`id`, `tel`, `pwo`) VALUES
('1583822374', '17730662313', 'asd123');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `gouwu`
--
ALTER TABLE `gouwu`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `home`
--
ALTER TABLE `home`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `site`
--
ALTER TABLE `site`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
