require_relative('../models/plushie')
require_relative('../models/brand')
require('pry-byebug')

Brand.delete_all()
Plushie.delete_all()

brand1 = Brand.new({
  "brand_name" => "San-X",
  "picture" => "http://tenshishop.com/wp-content/uploads/2014/03/sanx-logo-table.png",
  "description" => "San-X (サンエックス San Ekkusu?) is a Japanese stationery company known for creating and marketing cute characters such as Tarepanda, Rilakkuma, and Kogepan. The characters are usually anthropomorphic representations of animals or inanimate objects. Each character has its own quirky traits; for example, Momobuta is a pig with a head shaped like a peach, who enjoys karaoke and painting her nails. San-X head designer and creator of Tarepanda, Hikaru Suemasa said in 1999: It''s not just being cute. There is something different - a relaxed look, powerless."
  })

brand2 = Brand.new({
  "brand_name" => "Sanrio",
  "picture" => "https://s-media-cache-ak0.pinimg.com/originals/02/f0/cd/02f0cd305fe7ccbe77b5c7cb0399ab9d.png",
  "description" => "Sanrio Co., Ltd. (株式会社サンリオ Kabushikigaisha Sanrio?) is a Japanese company that designs, licenses and produces products focusing on the kawaii (cute) segment of Japanese popular culture. Their products include stationery, school supplies, gifts and accessories that are sold worldwide and at specialty brand retail stores in Japan. Sanrio''s best-known character is Hello Kitty (a.k.a. Kitty White), a little anthropomorphic cat girl. With her red bow and no visible mouth except in most of the animations, she is one of the most successful marketing brands in the world."
  })

brand1.save()
brand2.save()

plushie1 = Plushie.new({
  "name" => "Rilakkuma",
  "brand_id" => brand1.id,
  "quantity" => 5,
  "buy_price" => 3.50,
  "picture" => "https://media.giphy.com/media/qXU69Jg83HIFa/giphy.gif"
  })

plushie2 = Plushie.new({
  "name" => "Badtz-maru",
  "brand_id" => brand2.id,
  "quantity" => 8,
  "buy_price" => 2.90,
  "picture" => "http://www.oocities.org/soho/atrium/6557/batzmaru.gif"
  })

plushie3 = Plushie.new({
  "name" => "Cinnamoroll",
  "brand_id" => brand2.id,
  "quantity" => 10,
  "buy_price" => 3.25,
  "picture" => "http://orig09.deviantart.net/5b7d/f/2010/240/2/7/cinnamoroll_by_anniemaho-d2xgfrj.gif"
  })

plushie4 = Plushie.new({
  "name" => "Gudetama",
  "brand_id" => brand2.id,
  "quantity" => 2,
  "buy_price" => 4.40,
  "picture" => "https://media.giphy.com/media/sKjiRdGGlmk5q/giphy.gif"
  })

plushie1.save()
plushie2.save()
plushie3.save()
plushie4.save()

binding.pry
nil