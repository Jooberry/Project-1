require_relative('../models/plushie')
require_relative('../models/brand')
require('pry-byebug')

Brand.delete_all()
Plushie.delete_all()

brand1 = Brand.new({
  "brand_name" => "San-X",
  "picture" => "http://tenshishop.com/wp-content/uploads/2014/03/sanx-logo-table.png",
  "description" => "San-X (サンエックス San Ekkusu?) is a Japanese stationery company known for creating and marketing cute characters such as Tarepanda, Rilakkuma, and Kogepan. The characters are usually anthropomorphic representations of animals or inanimate objects. Each character has its own quirky traits; for example, Momobuta is a pig with a head shaped like a peach, who enjoys karaoke and painting her nails. San-X head designer and creator of Tarepanda, Hikaru Suemasa said in 1999: It's not just being cute. There is something different - a relaxed look, powerless."
  })

brand2 = Brand.new({
  "brand_name" => "Sanrio",
  "picture" => "https://s-media-cache-ak0.pinimg.com/originals/02/f0/cd/02f0cd305fe7ccbe77b5c7cb0399ab9d.png",
  "description" => "Sanrio Co., Ltd. (株式会社サンリオ Kabushikigaisha Sanrio?) is a Japanese company that designs, licenses and produces products focusing on the kawaii (cute) segment of Japanese popular culture. Their products include stationery, school supplies, gifts and accessories that are sold worldwide and at specialty brand retail stores in Japan. Sanrio's best-known character is Hello Kitty (a.k.a. Kitty White), a little anthropomorphic cat girl. With her red bow and no visible mouth except in most of the animations, she is one of the most successful marketing brands in the world."
  })

brand3 = Brand.new({
  "brand_name" => "Cartoonito",
  "picture" => "http://static.fjcdn.com/gifs/Molang_a1540c_5548807.gif",
  "description" => "South Korea!"
  })

brand4 = Brand.new({
  "brand_name" => "Pokemon",
  "picture" => "http://2.bp.blogspot.com/-j_GR1Tq5tP0/VbY3ueWy4qI/AAAAAAAAIvE/wCjca8TaU6g/s1600/Logo%2BPokemon.png",
  "description" => "Pocket Monsters that are kept inhumanely in tiny pokeballs. Japan!"
  })

brand1.save()
brand2.save()
brand3.save()
brand4.save()

plushie1 = Plushie.new({
  "name" => "Rilakkuma",
  "brand_id" => brand1.id,
  "quantity" => 5,
  "buy_price" => 3.50,
  "picture" => "https://media.giphy.com/media/qXU69Jg83HIFa/giphy.gif",
  "rating" => 92
  })

plushie2 = Plushie.new({
  "name" => "Badtz-maru",
  "brand_id" => brand2.id,
  "quantity" => 8,
  "buy_price" => 2.90,
  "picture" => "http://www.oocities.org/soho/atrium/6557/batzmaru.gif",
  "rating" => 25
  })

plushie3 = Plushie.new({
  "name" => "Cinnamoroll",
  "brand_id" => brand2.id,
  "quantity" => 10,
  "buy_price" => 3.25,
  "picture" => "http://orig09.deviantart.net/5b7d/f/2010/240/2/7/cinnamoroll_by_anniemaho-d2xgfrj.gif",
  "rating" => 64
  })

plushie4 = Plushie.new({
  "name" => "Gudetama",
  "brand_id" => brand2.id,
  "quantity" => 2,
  "buy_price" => 4.40,
  "picture" => "https://media.giphy.com/media/sKjiRdGGlmk5q/giphy.gif",
  "rating" => 100
  })

plushie5 = Plushie.new({
  "name" => "Molang",
  "brand_id" => brand3.id,
  "quantity" => 1,
  "buy_price" => 3.76,
  "picture" => "http://static.fjcdn.com/gifs/Molang_a1540c_5548807.gif",
  "rating" => 77
  })

plushie6 = Plushie.new({
  "name" => "Pikachu",
  "brand_id" => brand4.id,
  "quantity" => 6,
  "buy_price" => 2.89,
  "picture" => "https://cdn1.vox-cdn.com/uploads/chorus_asset/file/655222/tumblr_lmpg9jl57d1qfeod9.0.gif",
  "rating" => 85
  })

plushie1.save()
plushie2.save()
plushie3.save()
plushie4.save()
plushie5.save()
plushie6.save()

binding.pry
nil