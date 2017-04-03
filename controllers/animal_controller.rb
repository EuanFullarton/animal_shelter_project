require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/animal.rb' )

get '/animals' do
  @animals = Animal.all()
  @animals
  erb (:"animals/index")
end

get '/animals/new' do
  @animals = Animal.all()
  erb(:"animals/new")
end

post '/animals' do
  @animal = Animal.new(params)
  @animal.save()
  erb(:"animals/create")
end

get '/animals/:id' do
  @animal = Animal.find(params[:id])
  erb(:"animals/find")
end

get '/animals/:id/edit' do
@animal = Animal.find(params[:id])
erb (:"animals/edit")
end

post '/animals/:id' do
  animal = Animal.new(params)
  animal.edit()
  erb(:"animals/confirm_edit")
end

get '/animals/delete' do
  erb(:"animals/delete")
end

post '/animals/:id/delete' do
  Animal.delete(params[:id])
  redirect to("/animals/delete")
end