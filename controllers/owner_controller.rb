require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/owner.rb' )
require_relative( '../models/animal.rb' )


get '/owners' do
  @owners = Owner.all()
  erb ( :"owners/index" )
end

get '/owners/new' do
  @owners = Owner.all()
  erb(:"owners/new")
end

post '/owners' do
  @owner = Owner.new(params)
  @owner.save()
  erb(:"owners/create")
end

get '/owners/delete' do
  erb(:"owners/delete")
end

post '/owners/:id/delete' do
  Owner.delete(params[:id])
  redirect to("/owners/delete")
end
