require_relative( '../db/sql_runner')

class Booking

  attr_reader :id, :member_id, :lesson_id

  def initialize(details)
    @id = details['id'].to_i if details['id']
    @member_id = details['member_id'].to_i
    @lesson_id = details['lesson_id'].to_i
  end

end
