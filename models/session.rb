require_relative('../db/sql_runner')

class Session

  attr_reader :id
  attr_accessor :gym_class_id, :instructor_id, :studio_id, :available_spaces, :class_time, :class_date, :duration

  def initialize(options)
    @id = options['id'].to_i() if options['id']
    @gym_class_id = options['gym_class_id']
    @instructor_id = options['instructor_id']
    @studio_id = options['studio_id']
    @available_spaces = options['available_spaces'].to_i()
    @class_time = options['class_time']
    @class_date = options['class_date']
    @duration = options['duration']
  end

  def save()
    sql ="INSERT INTO sessions (gym_class_id, instructor_id, studio_id, available_spaces, class_time, class_date, duration)
    VALUES ($1, $2, $3, $4, $5, $6, $7) RETURNING *"
    values = [@gym_class_id, @instructor_id, @studio_id, @available_spaces, @class_time, @class_date, @duration]
    session = SqlRunner.run(sql, values)
    @id = session.first()['id'].to_i()
  end

  def update()
    sql = "UPDATE sessions SET (gym_class_id, instructor_id, studio_id, available_spaces, class_time, class_date, duration) = ($1, $2, $3, $4, $5, $6, $7) WHERE id = $8"
    values = [@gym_class_id, @instructor_id, @studio_id, @available_spaces, @class_time, @class_date, @duration, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM sessions WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all()
    sql = "DELETE FROM sessions"
    SqlRunner.run(sql)
  end

  def self.all()
    sql = "SELECT * FROM sessions"
    sessions = SqlRunner.run(sql)
    result = sessions.map { |session| Session.new(session) }
    return result
  end

  def self.find(id)
    sql = "SELECT * FROM sessions WHERE id = $1"
    values = [id]
    classes = SqlRunner.run(sql, values)
    result = Session.new(classes.first())
    return result
  end

end
