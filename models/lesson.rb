require_relative( '../db/sql_runner')

class Lesson

  attr_reader :id, :title, :instructor

  def initialize(details)
    @id = details['id'].to_i if details['id']
    @title = details['title']
    @instructor = details['instructor']
  end

end 
