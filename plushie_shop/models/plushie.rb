require_relative('../db/sql_runner')

class Plushie

  attr_reader :id, :name, :brand_id, :quantity, :buy_price

  def initialize(options)
    @id = options['id'].to_i
    @name = options['name']
    @brand_id = options['brand_id']
    @quantity = options['quantity'].to_i
    @buy_price = options['buy_price'].to_f.round(2)
  end

  def save()
    sql = "INSERT INTO plushies (name, brand_id, quantity, buy_price) VALUES ('#{@name}', #{@brand_id}, #{@quantity}, #{@buy_price}) RETURNING *"
    plushie_data = SqlRunner.run(sql)
    @id = plushie_data.first()['id'].to_i
  end

  def brand()
    sql = "SELECT * FROM brands WHERE brands.id = #{@brand_id}"
    brand = SqlRunner.run(sql).first
    return Brand.new(brand).brand_name
  end

  def update()
    sql = "UPDATE plushies SET (
        name,
        brand_id,
        quantity,
        buy_price) = ( 
        '#{@name}',
        #{@brand_id},
        #{@quantity},
        #{@buy_price})
        WHERE id = #{@id}"
      SqlRunner.run(sql)
  end

  def delete()
    sql = "DELETE FROM plushies WHERE id=#{@id};"
    SqlRunner.run(sql)
  end

  def show_stock_level()
    if @quantity <=3
      return "LOW"
    elsif @quantity >= 4 && @quantity <= 7
      return "MEDIUM"
    elsif @quantity >= 8
      return "HIGH"
    end
  end

  def buy_price_all()
    @buy_price * @quantity
  end

  def sell_price()
    sell_price = @buy_price * 2.7
    return sell_price.round(0) + 0.99
  end

  def sell_price_all()
    @quantity * sell_price
  end

  def profit()
    sell_price - @buy_price
  end

  def profit_all()
    @quantity * profit
  end

  def self.quantity_sum()
    # result = Plushie.all()
    # total = 0
    # result.each do |plushie|
    #   total += plushie.quantity
    # end
    # return total

    sql = "SELECT SUM(quantity) as total FROM plushies"
    result = SqlRunner.run(sql)
    return result.first["total"].to_i
  end

  def self.buy_price_total()
    result = Plushie.all()
    total = 0
    result.each do |plushie|
      total += plushie.buy_price_all
    end
    return total
  end

  def self.sell_price_total()
    result = Plushie.all()
    total = 0
    result.each do |plushie|
      total += plushie.sell_price_all
    end
    return total
  end

  def self.profit_total()
    result = Plushie.all()
    total = 0
    result.each do |plushie|
      total += plushie.profit_all
    end
    return total
  end

  def self.all()
    sql = "SELECT * FROM plushies"
    plushies = SqlRunner.run(sql)
    result = plushies.map { |plushie| Plushie.new(plushie)}
    return result
  end

  def self.find(id)
    sql = "SELECT * FROM plushies WHERE id=#{id}"
    plushie = SqlRunner.run(sql)
    result = Plushie.new(plushie.first)
    return result
  end

  def self.delete_all()
    sql = "DELETE FROM plushies"
    SqlRunner.run(sql)
  end

end