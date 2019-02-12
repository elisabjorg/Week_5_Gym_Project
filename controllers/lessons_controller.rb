require( 'sinatra' )
require( 'sinatra/contrib/all' )
# require( 'pry' )
require_relative( '../models/lesson.rb' )

also_reload( '../models/*' )

get '/lessons' do
  @lessons = Lesson.all()
  erb (:"lessons/index")
end

get '/lessons/new' do
  erb (:"lessons/new")
end

post '/lessons' do
  lesson = Lesson.new(params)
  lesson.save
  redirect('/lessons')
end

get '/lessons/:id' do
  @lesson = Lesson.find(params['id'].to_i)
  erb (:"lessons/show")
end

get '/lessons/:id/edit' do
  @lesson = Lesson.find(params['id'])
  erb(:"lessons/edit")
end

post '/lessons/:id' do
  lesson = Lesson.new(params)
  lesson.update()
  redirect("/lessons")
end

post '/lessons/:id/delete' do
  lesson = Lesson.find(params['id'].to_i)
  lesson.delete
  redirect to "/lessons"
end

# binding.pry
# nil
