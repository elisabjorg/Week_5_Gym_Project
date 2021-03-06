require_relative( '../db/sql_runner')

class Lesson

  attr_reader :id, :title, :instructor

  def initialize(details)
    @id = details['id'].to_i if details['id']
    @title = details['title']
    @instructor = details['instructor']
  end

  def save()
    sql = "INSERT INTO lessons
          (title, instructor)
          VALUES
          ($1, $2)
          RETURNING id"
    values = [@title, @instructor]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def members()
    sql = 'SELECT members.* FROM members
    INNER JOIN bookings
    ON members.id = bookings.member_id
    WHERE lesson_id = $1'
    values = [@id]
    result = SqlRunner.run(sql, values)
    return result.map{|member| Member.new(member)}
  end

  def update()
    sql = "UPDATE lessons SET (title, instructor) = ($1, $2) WHERE id = $3"
    values = [@title, @instructor, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = 'DELETE FROM lessons WHERE id = $1'
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.all()
    sql = "SELECT * FROM lessons"
    results = SqlRunner.run( sql )
    return results.map { |lesson| Lesson.new( lesson ) }
  end

  def self.find( id )
    sql = "SELECT * FROM lessons
    WHERE id = $1"
    values = [id]
    results = SqlRunner.run( sql, values )
    return Lesson.new( results.first )
  end

  def self.delete_all()
    sql = "DELETE FROM lessons"
    SqlRunner.run( sql )
  end

end
