require_relative('../db/sql_runner')

class Instructor

  attr_reader :id, :first_name, :last_name, :email, :phone_number
  attr_accessor

  def initialize(options)
    @id = options['id'].to_i() if options['id']
    @first_name = options['first_name']
    @last_name = options['last_name']
    @email = options['email']
    @phone_number = options['phone_number']
  end

  def save()
    sql ="INSERT INTO instructors (first_name, last_name, email, phone_number)
    VALUES ($1, $2, $3, $4) RETURNING *"
    values = [@first_name, @last_name, @email, @phone_number]
    instructor = SqlRunner.run(sql, values)
    @id = instructor.first()['id'].to_i()
  end

  def update()
    sql = "UPDATE instructors SET (first_name, last_name, email, phone_number) = ($1, $2, $3, $4) WHERE id = $5"
    values = [@first_name, @last_name, @id, @email, @phone_number]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM instructors WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all()
    sql = "DELETE FROM instructors"
    SqlRunner.run(sql)
  end

  def self.all()
    sql = "SELECT * FROM instructors"
    instructors = SqlRunner.run(sql)
    result = instructors.map { |instructor| Instructor.new(instructor) }
    return result
  end

  def self.find(id)
    sql = "SELECT * FROM instructors WHERE id = $1"
    values = [id]
    instructor = SqlRunner.run(sql, values)
    result = Instructor.new(instructor.first())
    return result
  end

  def full_name()
    return "#{first_name} #{last_name}"
  end

end
