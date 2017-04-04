require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/owner.rb' )
require_relative( '../models/animal.rb' )


get '/owners' do
  @owners = Owner.all()
  erb (:"owners/index")
end

get '/owners/new' do
  @owners = Owner.all()
  erb(:"owners/new")
end

post '/owners' do
  @owner = Owner.new(params)
  looking_for = ""
  looking_for = params["looking_for_dog"] if params["looking_for_dog"]
  looking_for += params["looking_for_cat"] if params["looking_for_cat"]
  @owner.looking_for = looking_for
  @owner.save()  
  erb(:"owners/create")
end

get '/owners/:id' do
  @owner = Owner.find(params[:id])
  erb(:"owners/find")
end

get '/owners/:id/edit' do
@owners = Owner.all()
@animals = Animal.all()
@owner = Owner.find(params[:id])
erb (:"owners/edit")
end

post '/owners/:id' do
  owner = Owner.new(params)
  owner.edit()
  erb(:"owners/confirm_edit")
end

post '/owners/:id/delete' do
  Owner.delete(params[:id])
  erb(:"owners/delete")
end
