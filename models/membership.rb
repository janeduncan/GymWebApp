require_relative('../db/sql_runner')

class Membership

  attr_reader :id, :type, :active

  def initialize(options)
    @id = options['id'].to_i() if options['id']
    @type = options['type']
    @active = true
  end

  def save()
    sql ="INSERT INTO memberships (type, active)
    VALUES ($1, $2) RETURNING *"
    values = [@type, @active]
    membership = SqlRunner.run(sql, values)
    @id = membership.first()['id'].to_i()
  end

  def update()
    sql = "UPDATE memberships SET (type, active) = ($1, $2) WHERE id = $3"
    values = [@type, @active, @id]
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
