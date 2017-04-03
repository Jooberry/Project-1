require_relative('../db/sql_runner')

class Plushie

  attr_reader :id, :name, :brand_id

  def initialize(options)
    @id = options['id'].to_i
    @name = options['name']
    @brand_id = options['brand_id']
  end

  def save()
    sql = "INSERT INTO plushies (name, brand_id) VALUES ('#{@name}', #{@brand_id}) RETURNING *"
    plushie_data = SqlRunner.run(sql)
    @id = plushie_data.first()['id'].to_i
  end

  def brand()
    sql = "SELECT * FROM brands WHERE brands.id = #{@brand_id}"
    brand = SqlRunner.run(sql).first
    return Brand.new(brand)
  end

  def update()
    sql = "UPDATE plushies SET (
        name,
        brand_id) = ( 
        '#{@name}',
        #{@brand_id})
        WHERE id = #{@id}"
      SqlRunner.run(sql)
  end

  def delete()
    sql = "DELETE FROM plushies WHERE id=#{ @id };"
    SqlRunner.run(sql)
  end

  def self.all()
    sql = "SELECT * FROM plushies;"
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