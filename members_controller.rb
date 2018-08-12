require("sinatra")
require("sinatra/contrib/all")
require("pry-byebug")

require_relative( './models/member.rb' )
also_reload( './models/*' )

# Index
get '/members' do
  @members = Member.all()
  erb(:"members/index")
end

# New
get '/members/new' do
  erb(:"members/new")
end

# Show
get '/members/:id' do
  @member = Member.find(params[:id])
  erb(:"members/show")
end

# Create
post '/members' do
  @member = Member.new(params)
  @member.save()
  erb(:"members/create")
end

# Edit
get '/members/:id/edit' do
  @member = Member.find(params[:id])
  erb(:"members/edit")
end

# Update
post '/members/:id' do
  Member.new(params).update
  redirect to '/members'
end

# Delete
post '/members/:id/delete' do
  member = Member.find(params[:id])
  member.delete()
  redirect to '/members'
end
