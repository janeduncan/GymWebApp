require_relative('../db/sql_runner')

class Member

  attr_reader :id
  attr_accessor :first_name, :last_name, :email, :phone_number, :membership_type

  def initialize(options)
    @id = options['id'].to_i() if options['id']
    @first_name = options['first_name']
    @last_name = options['last_name']
    @email = options['email']
    @phone_number = options['phone_number']
    @membership_type = options['membership_type']
  end

  def save()
    sql ="INSERT INTO members (first_name, last_name, email, phone_number, membership_type)
    VALUES ($1, $2, $3, $4, $5) RETURNING *"
    values = [@first_name, @last_name, @email, @phone_number, @membership_type]
    booking = SqlRunner.run(sql, values)
    @id = booking.first()['id'].to_i()
  end

  def update()
    sql = "UPDATE members SET (first_name, last_name, email, phone_number, membership_type) = ($1, $2, $3, $4, $5) WHERE id = $6"
    values = [@first_name, @last_name, @email, @phone_number, @membership_type, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM members WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all()
    sql = "DELETE FROM members"
    SqlRunner.run(sql)
  end

  def self.all()
    sql = "SELECT * FROM members"
    members = SqlRunner.run(sql)
    result = members.map { |member| Member.new(member) }
    return result
  end

  def self.find(id)
    sql = "SELECT * FROM members WHERE id = $1"
    values = [id]
    member = SqlRunner.run(sql, values)
    result = Member.new(member.first())
    return result
  end

end
