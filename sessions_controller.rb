require("sinatra")
require("sinatra/contrib/all")
require("pry-byebug")

require_relative( './models/session' )
also_reload( './models/*' )

# Index
get '/sessions' do
  @sessions = Session.all()
  erb(:"sessions/index")
end

# New
get '/sessions/new' do
  erb(:"sessions/new")
end

# Show
get '/sessions/:id' do
  @session = Session.find( params[:id] )
  erb(:"sessions/show")
end

# Create
post '/sessions' do
  @session = Session.new( params )
  @session.save()
  erb(:"sessions/create")
end

# Edit
get '/sessions/:id/edit' do
  @session = Session.find( params[:id] )
  erb( :"sessions/edit")
end

# Update
post '/sessions/:id' do
  session.new( params ).update
  redirect to '/sessions'
end

# Delete
post '/sessions/:id/delete' do
  session = Session.find( params[:id] )
  session.delete()
  redirect to '/sessions'
end
