require_relative( '../db/sql_runner')

class Booking

  attr_reader :id, :member_id, :lesson_id

  def initialize(details)
    @id = details['id'].to_i if details['id']
    @member_id = details['member_id'].to_i
    @lesson_id = details['lesson_id'].to_i
  end

  def save()
    sql = "INSERT INTO bookings
          (member_id, lesson_id)
          VALUES
          ($1, $2)
          RETURNING id"
    values = [@member_id, @lesson_id]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def member()
    sql = "SELECT * FROM members where id = $1"
    values = [@member_id]
    results = SqlRunner.run(sql, values)
    return Member.new(results.first)
  end

  def lesson()
    sql = "SELECT * FROM lessons where id = $1"
    values = [@lesson_id]
    results = SqlRunner.run(sql, values)
    return Lesson.new(results.first)
  end

  def delete ()
    sql = 'DELETE FROM bookings WHERE id = $1'
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.all()
    sql = "SELECT * FROM bookings"
    results = SqlRunner.run( sql )
    return results.map { |booking| Booking.new( booking ) }
  end

  def self.find( id )
    sql = "SELECT * FROM bookings
    WHERE id = $1"
    values = [id]
    results = SqlRunner.run( sql, values )
    return Booking.new( results.first )
  end

  def self.delete_all()
    sql = "DELETE FROM bookings"
    SqlRunner.run( sql )
  end

  def self.delete(id)
  sql = "DELETE FROM bookings
  WHERE id = $1"
  values = [@id]
  SqlRunner.run( sql, values )
end

end
