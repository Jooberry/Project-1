require_relative('../db/sql_runner')

class Brand

  attr_reader :id, :brand_name, :picture, :description

  def initialize(options)
    @id = options['id'].to_i
    @brand_name = options['brand_name']
    @picture = options['picture']
    @description = options['description'].gsub("''", "'")
  end

  def save()
    @description = @description.gsub("'", "''")
    sql = "INSERT INTO brands (brand_name, picture, description) VALUES ('#{@brand_name}', '#{@picture}', '#{@description}') RETURNING *"
    brand_data = SqlRunner.run(sql)
    @id = brand_data.first()['id'].to_i
  end

  def characters()
    sql = "SELECT * FROM plushies WHERE id = #{@brand_id}"
    result = SqlRunner.run(sql)
    return Plushie.new(result.first)
  end

  def update()
    @description = @description.gsub("'", "''")
    sql = "UPDATE brands SET (
        brand_name, picture, description) = ( 
        '#{@brand_name}', '#{@picture}', '#{@description}')
        WHERE id = #{@id}"
      SqlRunner.run(sql)
  end

  def delete()
    sql = "DELETE FROM brands WHERE id=#{ @id };"
    SqlRunner.run(sql)
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