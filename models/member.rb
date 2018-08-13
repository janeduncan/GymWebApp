require_relative('../db/sql_runner')

class Member

  attr_reader :id
  attr_accessor :first_name, :last_name, :membership_type

  def initialize(options)
    @id = options['id'].to_i() if options['id']
    @first_name = options['first_name']
    @last_name = options['last_name']
    @membership_type = options['membership_type']
  end

  def save()
    sql ="INSERT INTO members (first_name, last_name, membership_type)
    VALUES ($1, $2, $3) RETURNING *"
    values = [@first_name, @last_name, @membership_type]
    booking = SqlRunner.run(sql, values)
    @id = booking.first()['id'].to_i()
  end

  def update()
    sql = "UPDATE members SET (first_name, last_name, membership_type) = ($1, $2, $3) WHERE id = $4"
    values = [@first_name, @last_name, @membership_type, @id]
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

  # Not currently in use
  
  # def membership()
  #   sql = "SELECT * FROM memberships WHERE id = $1"
  #   values = [@membership_type]
  #   member = SqlRunner.run(sql, values)
  #   return Membership.new(member.first())
  # end

end
