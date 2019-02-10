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

  def self.all()
    sql = "SELECT * FROM lessons"
    results = SqlRunner.run( sql )
    return results.map { |lesson| Lesson.new( lesson ) }
  end

  def self.delete_all()
    sql = "DELETE FROM lessons"
    SqlRunner.run( sql )
  end

end
