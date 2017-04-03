require_relative('../models/plushie')
require_relative('../models/brand')
require('pry-byebug')

Brand.delete_all()
Plushie.delete_all()

brand1 = Brand.new({
  "brand_name" => "San-X"
  })

brand2 = Brand.new({
  "brand_name" => "Sanrio"
  })

brand1.save()
brand2.save()

plushie1 = Plushie.new({
  "name" => "Rilakkuma",
  "brand_id" => brand1.id,
  "quantity" => 5,
  "buy_price" => 3.50
  })

plushie2 = Plushie.new({
  "name" => "Badtz-maru",
  "brand_id" => brand2.id,
  "quantity" => 8,
  "buy_price" => 2.90
  })

plushie3 = Plushie.new({
  "name" => "Cinnamoroll",
  "brand_id" => brand2.id,
  "quantity" => 10,
  "buy_price" => 3.25
  })

plushie4 = Plushie.new({
  "name" => "Gudetama",
  "brand_id" => brand2.id,
  "quantity" => 2,
  "buy_price" => 4.40
  })

plushie1.save()
plushie2.save()
plushie3.save()
plushie4.save()

binding.pry
nil