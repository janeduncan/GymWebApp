require_relative('../db/sql_runner')

class Membership

  attr_reader :id, :type
  attr_accessor 

  def initialize(options)
    @id = options['id'].to_i() if options['id']
    @type = options['type']
  end

  def save()
    sql ="INSERT INTO memberships (type)
    VALUES ($1) RETURNING *"
    values = [@type]
    membership = SqlRunner.run(sql, values)
    @id = membership.first()['id'].to_i()
  end

  def update()
    sql = "UPDATE memberships SET type = $1 WHERE id = $2"
    values = [@type, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM memberships WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all()
    sql = "DELETE FROM memberships"
    SqlRunner.run(sql)
  end

  def self.all()
    sql = "SELECT * FROM memberships"
    memberships = SqlRunner.run(sql)
    result = memberships.map { |membership| membership.new(membership) }
    return result
  end

  def self.find(id)
    sql = "SELECT * FROM memberships WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql, values)
    return membership.new(result.first())
  end

end
