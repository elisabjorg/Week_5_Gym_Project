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

  def lesson()
    sql = "SELECT * FROM lessons where id = $1"
    values = [@lesson_id]
    results = SqlRunner.run(sql, values)
    return Lesson.new(results.first)
  end

  def self.all()
    sql = "SELECT * FROM members"
    results = SqlRunner.run( sql )
    return results.map { |member| Member.new( member ) }
  end

  def self.delete_all()
    sql = "DELETE FROM members"
    SqlRunner.run( sql )
  end


end
