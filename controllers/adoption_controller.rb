require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative( '../models/adoption.rb' )
require_relative( '../models/animal.rb' )
require_relative( '../models/owner.rb' )

get '/adoptions' do
  @adoptions = Adoption.all
  erb (:"adoptions/index")
end

get '/adoptions/new' do
  @animals = Animal.all
  @owners = Owner.all
  erb(:"adoptions/new")
end

get '/adoptions/:id/preferred_adopt' do
  @animals = Animal.all
  @owners = Owner.all
  @owner = Owner.find(params[:id])
  erb(:"adoptions/preferred_adopt")
end

post '/adoptions' do
  adoption = Adoption.new(params)
  animal = Animal.find(params["animal_id"])
  animal.adopt()
  animal.unavailable()
  animal.edit()
  adoption.save
  redirect to("/adoptions")
end

get '/adoptions/delete' do
  erb(:"adoptions/delete")
end

post '/adoptions/:id/delete' do
  adoption = Adoption.find(params[:id])
  animal = Animal.find(adoption.animal_id)
  animal.return()
  animal.edit()
  Adoption.delete(params[:id])
  redirect to("/adoptions/delete")
end
