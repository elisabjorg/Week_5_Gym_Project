require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative( '../models/booking.rb' )
require_relative( '../models/member.rb' )
require_relative( '../models/lesson.rb' )

also_reload( '../models/*' )

get '/bookings' do
  @members = Member.all
  @lessons = Lesson.all
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

post '/bookings/:id/delete' do
  Booking.destroy(params[:id])
  redirect to("/bookings")
end
