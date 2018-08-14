require_relative('../db/sql_runner')

class Booking

  attr_reader :id, :member_id, :session_id
  attr_accessor

  def initialize(options)
    @id = options['id'].to_i() if options['id']
    @member_id = options['member_id'].to_i()
    @session_id = options['session_id'].to_i()
  end

  def save()
    sql ="INSERT INTO bookings (member_id, session_id)
    VALUES ($1, $2) RETURNING *"
    values = [@member_id, @session_id]
    booking = SqlRunner.run(sql, values)
    @id = booking.first()['id'].to_i()
  end

  # Don't need this?

  # def update()
  #   sql = "UPDATE bookings SET (member_id, session_id) = ($1, $2) WHERE id = $3"
  #   values = [@member_id, @session_id, @id]
  #   SqlRunner.run(sql, values)
  # end

  def delete()
    sql = "DELETE FROM bookings WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all()
    sql = "DELETE FROM bookings"
    SqlRunner.run(sql)
  end

  def self.all()
    sql = "SELECT * FROM bookings"
    bookings = SqlRunner.run(sql)
    result = bookings.map { |booking| Booking.new(booking) }
    return result
  end

  def self.find(id)
    sql = "SELECT * FROM bookings WHERE id = $1"
    values = [id]
    booking = SqlRunner.run(sql, values)
    return Booking.new(booking.first())
  end

  def member()
    sql = "SELECT * FROM members WHERE id = $1"
    values = [@member_id]
    member = SqlRunner.run(sql, values)
    return Member.new(member.first())
  end

  def gym_session()
    sql = "SELECT * FROM sessions WHERE id = $1"
    values = [@session_id]
    result = SqlRunner.run(sql, values)
    return Session.new(result.first())
  end

end
