require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/owner.rb' )

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
