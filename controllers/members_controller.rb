require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative( '../models/member.rb' )

also_reload( '../models/*' )

get '/member' do
  @members = Member.all()
  erb (:"members/index")
end

# get '/members/:id' do
#   @member = Member.find(params['id'].to_i)
#   erb (:"members/show")
# end
#
# get '/members/new' do
#   erb (:"members/new")
# end
