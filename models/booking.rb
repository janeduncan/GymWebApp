require_relative('../db/sql_runner')

class Booking

  attr_reader :id
  attr_accessor :member_id, :class_id

  def initialize(options)
    @id = options['id'].to_i() if options['id']
    @member_id = options['member_id'].to_i()
    @class_id = options['class_id'].to_i()
  end

  def save()
    sql ="INSERT INTO bookings (member_id, class_id)
    VALUES ($1, $2) RETURNING *"
    values = [@member_id, @class_id]
    booking = SqlRunner.run(sql, values)
    @id = booking.first()['id'].to_i()
  end

  def update()
    sql = "UPDATE bookings SET (member_id, class_id) = ($1, $2) WHERE id = $3"
    values = [@member_id, @class_id, @id]
    SqlRunner.run(sql, values)
  end

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
    houses = SqlRunner.run(sql)
    result = bookings.map { |booking| Booking.new(booking) }
    return result
  end

  def self.find(id)
    sql = "SELECT * FROM bookings WHERE id = $1"
    values = [id]
    booking = SqlRunner.run(sql, values)
    result = Booking.new(booking.first())
    return result
  end

end
