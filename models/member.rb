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

end
