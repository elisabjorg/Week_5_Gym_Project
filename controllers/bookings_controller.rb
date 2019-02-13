require( 'sinatra' )
require( 'sinatra/contrib/all' )
# require( 'pry' )
require_relative( '../models/booking.rb' )
require_relative( '../models/member.rb' )
require_relative( '../models/lesson.rb' )

also_reload( '../models/*' )

get '/bookings' do
  @bookings = Booking.all
  erb ( :"bookings/index")
end

get '/bookings/new' do
  @members = Member.all
  @lessons = Lesson.all
  erb ( :"bookings/new")
end

post '/bookings' do
  booking = Booking.new(params)
  booking.save
  redirect to("/bookings")
end

get '/bookings/:id' do
  @lesson = Lesson.find(params['id'].to_i)
  @member = Member.find(params['id'].to_i)
  erb (:"bookings/show")
end

post '/bookings/:id/delete' do
  Booking.delete(params[:id])
  redirect to("/bookings")
end

# binding.pry
# nil
