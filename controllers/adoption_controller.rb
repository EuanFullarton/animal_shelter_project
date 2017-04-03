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

post '/adoptions' do
  @animals = Animal.all
  adoption = Adoption.new(params)
  adoption.save
  redirect to("/adoptions")
end

get '/adoptions/delete' do
  erb(:"adoptions/delete")
end

post '/adoptions/:id/delete' do
  Adoption.delete(params[:id])
  redirect to("/adoptions/delete")
end