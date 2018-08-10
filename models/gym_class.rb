require_relative('../db/sql_runner')

class GymClass

  attr_reader :id
  attr_accessor :class_name, :description

  def initialize(options)
    @id = options['id'].to_i() if options['id']
    @class_name = options['class_name']
    @description = options['description']
  end

  def save()
    sql ="INSERT INTO gym_classes (class_name, description)
    VALUES ($1, $2) RETURNING *"
    values = [@class_name, @description]
    gymclass = SqlRunner.run(sql, values)
    @id = gymclass.first()['id'].to_i()
  end

  def update()
    sql = "UPDATE gym_classes SET (class_name, description) = ($1, $2) WHERE id = $3"
    values = [@class_name, @description, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM gym_classes WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all()
    sql = "DELETE FROM gym_classes"
    SqlRunner.run(sql)
  end

  def self.all()
    sql = "SELECT * FROM gym_classes"
    classes = SqlRunner.run(sql)
    result = classes.map { |gymclass| GymClass.new(gymclass) }
    return result
  end

  def self.find(id)
    sql = "SELECT * FROM gym_classes WHERE id = $1"
    values = [id]
    classes = SqlRunner.run(sql, values)
    result = GymClass.new(classes.first())
    return result
  end

end
