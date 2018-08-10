require_relative('../db/sql_runner')

class Studio

  attr_reader :id
  attr_accessor :studio

  def initialize(options)
    @id = options['id'].to_i() if options['id']
    @studio = options['studio']
  end

  def save()
    sql ="INSERT INTO studios (studio)
    VALUES ($1) RETURNING *"
    values = [@studio]
    studio = SqlRunner.run(sql, values)
    @id = studio.first()['id'].to_i()
  end

  def update()
    sql = "UPDATE studios SET studio = $1 WHERE id = $2"
    values = [@studio, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM studios WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all()
    sql = "DELETE FROM studios"
    SqlRunner.run(sql)
  end

  def self.all()
    sql = "SELECT * FROM studios"
    studios = SqlRunner.run(sql)
    result = studios.map { |studio| Studio.new(studio) }
    return result
  end

  def self.find(id)
    sql = "SELECT * FROM studios WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql, values)
    return Studio.new(result.first())
  end

end
