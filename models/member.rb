require_relative( '../db/sql_runner')

class Member

  attr_reader :id, :first_name, :last_name, :address, :email

  def initialize(details)
    @id = details['id'].to_i if details['id']
    @first_name = details['first_name']
    @last_name = details['last_name']
    @address = details['address']
    @email = details['email']
  end

  def save()
    sql = "INSERT INTO members
          (first_name, last_name, address, email)
          VALUES
          ($1, $2, $3, $4)
          RETURNING id"
    values = [@first_name, @last_name, @address, @email]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  # def lesson()
  #   sql = "SELECT l.* FROM lessons l INNER JOIN bookings
  #   b ON b.member_id = l.id WHERE b.member_id = $1"
  #   values = [@id]
  #   results = SqlRunner.run(sql, values)
  #   return results.map {|lesson| Lesson.new(lesson)}
  # end

  def lessons()
  sql = 'SELECT lessons.* FROM lessons
  INNER JOIN bookings
  ON lessons.id = bookings.lesson_id
  WHERE member_id = $1'
  values = [@id]
  result = SqlRunner.run(sql, values)
  return result.map {|lesson| Lesson.new(lesson)}
end

  def full_name()
    return "#{@first_name} #{@last_name}"
  end

  def update ()
    sql = 'UPDATE members SET(first_name, last_name, address, email)
    = ($1, $2, $3, $4) WHERE id = $5'
    values = [@first_name, @last_name, @address, @email, @id]
    SqlRunner.run(sql, values)
  end

  def delete ()
    sql = 'DELETE FROM members WHERE id = $1'
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.all()
    sql = "SELECT * FROM members"
    results = SqlRunner.run( sql )
    return results.map { |member| Member.new( member ) }
  end

  def self.find( id )
    sql = "SELECT * FROM members WHERE id = $1"
    values = [id]
    results = SqlRunner.run( sql, values )
    return Member.new( results.first )
  end

  def self.delete_all()
    sql = "DELETE FROM members"
    SqlRunner.run( sql )
  end


end
