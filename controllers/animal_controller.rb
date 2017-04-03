require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/animal.rb' )
require_relative( '../models/adoption.rb' )

get '/animals' do
  @animals = Animal.all()
  @adoptions = Adoption.all()
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

post '/animals/:id/delete' do
  Animal.delete(params[:id])
  erb(:"animals/delete")
end