require_relative('../db/sql_runner')

class GymClass

  attr_reader :id
  attr_accessor :class_name, :description, :instructor, :capacity, :class_time, :class_date, :duration

  def initialize(options)
    @id = options['id'].to_i() if options['id']
    @class_name = options['class_name']
    @description = options['description']
    @instructor = options['instructor']
    @capacity = options['capacity'].to_i()
    @class_time = options['class_time']
    @class_date = options['class_date']
    @duration = options['duration']
  end

  def save()
    sql ="INSERT INTO members (class_name, description, instructor, capacity, class_time, class_date, duration)
    VALUES ($1, $2, $3, $4, $5, $6, $7) RETURNING *"
    values = [@class_name, @description, @instructor, @capacity, @class_time, @class_date, @duration]
    gymclass = SqlRunner.run(sql, values)
    @id = gymclass.first()['id'].to_i()
  end

  def update()
    sql = "UPDATE members SET (class_name, description, instructor, capacity, class_time, class_date, duration) = ($1, $2, $3, $4, $5, $6, $7) WHERE id = $8"
    values = [@class_name, @description, @instructor, @capacity, @class_time, @class_date, @duration, @id]
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
