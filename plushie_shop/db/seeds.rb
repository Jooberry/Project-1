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

