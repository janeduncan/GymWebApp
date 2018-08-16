require_relative('../db/sql_runner')

class Session

  attr_reader :id, :gymclass_id, :instructor_id, :studio_id, :available_spaces, :class_time, :class_date, :duration, :peak_hours

  def initialize(options)
    @id = options['id'].to_i() if options['id']
    @gymclass_id = options['gymclass_id']
    @instructor_id = options['instructor_id']
    @studio_id = options['studio_id']
    @available_spaces = options['available_spaces'].to_i()
    @class_time = options['class_time']
    @class_date = options['class_date']
    # @class_date = DateTime.strptime(options['class_date'], "%Y-%m-%d")
    @duration = options['duration']
    @peak_hours = options['peak_hours']
  end

  def save()
    sql ="INSERT INTO sessions (gymclass_id, instructor_id, studio_id, available_spaces, class_time, class_date, duration, peak_hours)
    VALUES ($1, $2, $3, $4, $5, $6, $7, $8) RETURNING *"
    values = [@gymclass_id, @instructor_id, @studio_id, @available_spaces, @class_time, @class_date, @duration, @peak_hours]
    session = SqlRunner.run(sql, values)
    @id = session.first()['id'].to_i()
  end

  def update()
    sql = "UPDATE sessions SET (gymclass_id, instructor_id, studio_id, available_spaces, class_time, class_date, duration, peak_hours) = ($1, $2, $3, $4, $5, $6, $7, $8) WHERE id = $9"
    values = [@gymclass_id, @instructor_id, @studio_id, @available_spaces, @class_time, @class_date, @duration, @peak_hours, @id]
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

  def gymclass()
    sql = "SELECT * FROM gymclasses WHERE id = $1"
    values = [@gymclass_id]
    return SqlRunner.run(sql, values).first['class_name']
  end

  def instructor()
    sql = "SELECT * FROM instructors WHERE id = $1"
    values = [@instructor_id]
    instructor = SqlRunner.run(sql, values)
    return Instructor.new(instructor.first())
  end

  def studio()
    sql = "SELECT * FROM studios WHERE id = $1"
    values = [@studio_id]
    return SqlRunner.run(sql, values).first['studio']
  end

  def members()
    sql = "SELECT members.* FROM members INNER JOIN bookings on members.id = bookings.member_id WHERE bookings.session_id = $1"
    values = [@id]
    members = SqlRunner.run(sql, values)
    result = members.map{ |member| Member.new(member) }
  end

  def pretty_time()
    sql = "SELECT to_char(class_time, 'HH24:MI') FROM sessions WHERE id = $1"
    values = [@id]
    return SqlRunner.run(sql, values).first['to_char']
  end

  def add_member_to_class(member)
    return unless @available_spaces > 0
    return unless member.can_book_class?()
    Booking.new("member_id" => member.id, "session_id" => @id).save()
    @available_spaces -= 1
    update()
  end

  # Checks if a class is within a specified date range (i.e the future not a past class)
  # Will only work if @class_date is a String (cant compare DateTime & String)
  # Would be better to use DateTime.now as start_date?

  def upcoming_class()
    start_date = "2018-08-15"
    end_date = "2018-12-31"
    return true if @class_date.between?(start_date, end_date)
  end

  # Removed this for now so upcoming_class() method works
  def pretty_date()
    return @class_date.strftime("%d-%b-%Y")
  end

end
