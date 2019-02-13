require( 'sinatra' )
require( 'sinatra/contrib/all' )
# require( 'pry' )
require_relative( '../models/member.rb' )

also_reload( '../models/*' )

get '/members' do
  @members = Member.all()
  erb (:"members/index")
end

get '/members/new' do
  erb (:"members/new")
end

post '/members' do
  member = Member.new(params)
  member.save
  redirect('/members')
end

get '/members/:id' do
  @member = Member.find(params['id'].to_i)
  erb (:"members/show")
end

get '/members/:id/edit' do
  @member = Member.find(params['id'].to_i)
  erb (:"members/edit")
end

post '/members/:id' do
  member = Member.new(params)
  member.update()
  redirect("/members")
end

post '/members/:id/delete' do
  member = Member.find(params['id'].to_i)
  member.delete
  redirect to "/members"
end
#
# binding.pry
# nil
