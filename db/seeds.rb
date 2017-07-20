User.create(name: '和朴轩', address: '山东省 济南市 长清区 御龙湾小区 301', phone: '13685312558', password: '1111111', password_confirmation: '1111111')

category_men = Category.create(
  name: '男士体恤'
)

category_women = Category.create(
  name: '女士体恤'
)

category_kid = Category.create(
  name: '儿童体恤'
)

category_cell_case = Category.create(
  name: '手机壳'
)

campaign_nba = Campaign.create(
  name: 'NBA',
  img: '//a.espncdn.com/photo/2016/0602/nba_0602nbaplayoffs_1296x518.jpeg'
)

campaign_2 = Campaign.create(
  name: '父亲节',
  img: '//image.spreadshirtmedia.com/content/t_std/f_auto/cms/startpage/tiles/men_us_1609'
)

campaign_3 = Campaign.create(
  name: '母亲节',
  img: '//s7.jcrew.com/is/image/jcrew/2017jul_hp1_w_topsearrings?wid=596&fmt=jpeg&qlt=80&resMode=sharp'
)

campaign_4 = Campaign.create(
  name: '星球大战',
  img: '//upload.wikimedia.org/wikipedia/zh/3/3c/%E6%98%9F%E7%90%83%E5%A4%A7%E6%88%B0%EF%BC%9A%E5%8E%9F%E5%8A%9B%E9%87%8B%E6%94%BE_II.jpeg'
)

campaign_5 = Campaign.create(
  name: '儿童节',
  img: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSAFPeMZlR0dPU_kfSrAtdGG2MIg6r4ZpNBbX3B_dtj-hDAxufN'
)

campaign_6 = Campaign.create(
  name: '神奇女侠',
  img: '//www.indiewire.com/wp-content/uploads/2016/07/wonder-woman.jpg'
)

Product.create(
  item_id: 4561,
  ratings: 4,
  name: '男士纯棉体恤',
  description: '100%纯棉体恤',
  sizes: 's,m,l,xl',
  price: 30.00,
  img_front: '//makeyourfashion.oss-cn-shanghai.aliyuncs.com/grey_front.png',
  img: '//makeyourfashion.oss-cn-shanghai.aliyuncs.com/eeda4dd8-fa2d-446d-9fea-60f86d2e72e3-1.png',
  img_back: '//makeyourfashion.oss-cn-shanghai.aliyuncs.com/grey_back',
  category_id: category_men.id
)

Product.create(
  item_id: 4564,
  ratings: 5,
  name: '女士纯棉体恤',
  description: '100%纯棉体恤',
  sizes: 's,m,l,xl',  
  price: 30.00,
  img_front: '//makeyourfashion.oss-cn-shanghai.aliyuncs.com/blue_front.png',
  img: 'http://makeyourfashion.oss-cn-shanghai.aliyuncs.com/38f26ba3-2d7c-45a7-8ad9-30481a87d46e-1.jpg',
  img_back: '//makeyourfashion.oss-cn-shanghai.aliyuncs.com/blue_back.png',
  category_id: category_women.id
)

product3 = Product.create(
  item_id: 4564,
  ratings: 3,
  name: '女士纯棉体恤',
  description: '100%纯棉体恤',
  sizes: 's,m,l,xl',  
  price: 30.00,
  img_front: '//makeyourfashion.oss-cn-shanghai.aliyuncs.com/blue_front.png',
  img: '//makeyourfashion.oss-cn-shanghai.aliyuncs.com/ba4ecae7-013a-45c0-87ff-1a566564c9aa-23.png',
  img_back: '//makeyourfashion.oss-cn-shanghai.aliyuncs.com/blue_back.png',
  category_id: category_women.id,
  campaign_id: campaign_3.id
)

product4 = Product.create(
  item_id: 4561,
  ratings: 5,
  name: 'Stephen Curry',
  description: 'Stephen Curry 夺冠纪念',
  sizes: 's,m,l,xl',  
  price: 30.00,
  img_front: '//makeyourfashion.oss-cn-shanghai.aliyuncs.com/grey_front.png',
  img: '//makeyourfashion.oss-cn-shanghai.aliyuncs.com/9003753f-7f54-4034-a73d-a032ae0c0056-100.png',
  img_back: '//makeyourfashion.oss-cn-shanghai.aliyuncs.com/grey_front.png',
  campaign_id: campaign_nba.id
)

product5 = Product.create(
  item_id: 4561,
  ratings: 5,
  name: 'James Harden',
  description: 'James Harden',
  sizes: 's,m,l,xl',  
  price: 30.00,
  img_front: '//makeyourfashion.oss-cn-shanghai.aliyuncs.com/grey_front.png',
  img: '//makeyourfashion.oss-cn-shanghai.aliyuncs.com/d3ed1eb3-3603-4d05-832c-2ed7aabce5fb-101.png',
  img_back: '//makeyourfashion.oss-cn-shanghai.aliyuncs.com/grey_front.png',
  campaign_id: campaign_nba.id
)

tag1 = Tag.create(name: '卡通')
tag2 = Tag.create(name: '奇幻')
tag3 = Tag.create(name: '动物')
tag4 = Tag.create(name: 'nba')
tag5 = Tag.create(name: '体育')
tag6 = Tag.create(name: '编程')
tag7 = Tag.create(name: '风景')
tag8 = Tag.create(name: '游戏')
tag9 = Tag.create(name: '生活')

design1 = Design.create(img_url: '//makeyourfashion.oss-cn-shanghai.aliyuncs.com/a.png', tags: [tag1, tag3])
design2 = Design.create(img_url: '//makeyourfashion.oss-cn-shanghai.aliyuncs.com/c.png', tags: [tag2])
design3 = Design.create(img_url: '//makeyourfashion.oss-cn-shanghai.aliyuncs.com/d.png', tags: [tag1, tag3])
design4 = Design.create(img_url: '//makeyourfashion.oss-cn-shanghai.aliyuncs.com/e.png', tags: [tag1])

design5 = Design.create(img_url: '//makeyourfashion.oss-cn-shanghai.aliyuncs.com/4ab07cc1-b4e4-4eeb-a076-5c61d4265544-bil-sc.jpg', tags: [tag4])
design6 = Design.create(img_url: '//makeyourfashion.oss-cn-shanghai.aliyuncs.com/1adeed9c-b263-40ff-a3fe-cdf7f98d5934-jh.jpg', tags: [tag4])
Design.create(img_url: '//makeyourfashion.oss-cn-shanghai.aliyuncs.com/sport1.png', tags: [tag5])
Design.create(img_url: '//makeyourfashion.oss-cn-shanghai.aliyuncs.com/sport2.png', tags: [tag5])
Design.create(img_url: '//makeyourfashion.oss-cn-shanghai.aliyuncs.com/sport3.png', tags: [tag5])
Design.create(img_url: '//makeyourfashion.oss-cn-shanghai.aliyuncs.com/sport4.png', tags: [tag5])
Design.create(img_url: '//makeyourfashion.oss-cn-shanghai.aliyuncs.com/sport5.png', tags: [tag5])

DesignDetail.create(
  height: 1077.7777777777778,
  width: 983.3333333333333,
  x: 5.555555555555555,
  y: 275,
  design: design1,
  product: product3,
  pic_id: 'imgFront'
)

DesignDetail.create(
  height: 1077.7777777777778,
  width: 983.3333333333333,
  x: 5.555555555555555,
  y: 275,
  design: design5,
  product: product4,
  pic_id: 'imgFront'
)

TextDetail.create(
  height: 1077.7777777777778,
  width: 983.3333333333333,
  x: 5.555555555555555,
  y: 1402.7777777777778,
  text: 'Stephen Curry',
  font_size: 'Arial',
  align: 'center',
  bold: true,
  italic: true,
  font_size: 30,
  color: '#000',
  product: product4,
  pic_id: 'imgFront'
)

DesignDetail.create(
  height: 1077.7777777777778,
  width: 983.3333333333333,
  x: 5.555555555555555,
  y: 275,
  design: design6,
  product: product5,
  pic_id: 'imgFront'
)

TextDetail.create(
  height: 1077.7777777777778,
  width: 983.3333333333333,
  x: 5.555555555555555,
  y: 1402.7777777777778,
  text: 'James Harden',
  font_size: 'Arial',
  align: 'center',
  bold: true,
  italic: true,
  font_size: 30,
  color: '#000',
  product: product5,
  pic_id: 'imgFront'
)
