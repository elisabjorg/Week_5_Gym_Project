require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative('controllers/bookings_controller.rb')
require_relative('controllers/members_controller.rb')
require_relative('controllers/lessons_controller.rb')

get '/' do
  erb (:index)
end
