require_relative('../db/sql_runner')

class Brand

  attr_reader :id, :brand_name

  def initialize(options)
    @id = options['id'].to_i
    @brand_name = options['brand_name']
  end

  def save()
    sql = "INSERT INTO brands (brand_name) VALUES ('#{@brand_name}') RETURNING *"
    brand_data = SqlRunner.run(sql)
    @id = brand_data.first()['id'].to_i
  end

  def characters()
    sql = "SELECT * FROM plushies WHERE id = #{@brand_id}"
    result = SqlRunner.run(sql)
    return Plushie.new(result.first)
  end

  def self.all()
    sql = "SELECT * FROM brands;"
    brands = SqlRunner.run(sql)
    result = brands.map { |brand| Brand.new(brand)}
    return result
  end

  def self.find(id)
    sql = "SELECT * FROM brands WHERE id=#{id}"
    brand = SqlRunner.run(sql)
    result = Brand.new(brand.first)
    return result
  end

  def self.delete_all()
    sql = "DELETE FROM brands"
    SqlRunner.run(sql)
  end

end