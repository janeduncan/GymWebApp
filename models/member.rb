require_relative('../db/sql_runner')

class Member

  attr_reader :id, :first_name, :last_name, :membership_type, :email, :phone_number

  def initialize(options)
    @id = options['id'].to_i() if options['id']
    @first_name = options['first_name']
    @last_name = options['last_name']
    @membership_type = options['membership_type']
    @email = options['email']
    @phone_number = options['phone_number']
  end

  def save()
    sql ="INSERT INTO members (first_name, last_name, membership_type, email, phone_number)
    VALUES ($1, $2, $3, $4, $5) RETURNING *"
    values = [@first_name, @last_name, @membership_type, @email, @phone_number]
    booking = SqlRunner.run(sql, values)
    @id = booking.first()['id'].to_i()
  end

  def update()
    sql = "UPDATE members SET (first_name, last_name, membership_type, email, phone_number) = ($1, $2, $3, $4, $5) WHERE id = $6"
    values = [@first_name, @last_name, @membership_type, @email, @phone_number, @id]
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

  def full_name()
    return "#{first_name} #{last_name}"
  end

  def can_book_class?()
    return true if (@membership_type == "Standard" && @off_peak == true) || (@membership_type == "Premium")
  end
  
end
