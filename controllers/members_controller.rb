require("sinatra")
require("sinatra/contrib/all")
require("pry-byebug")
require_relative("../models/member")
also_reload("./models/*")

# Index
get '/members' do
  @members = Member.all()
  erb(:"../views/members/index")
end

# New
get '/members/new' do
  erb(:"../views/members/new")
end

# Show
get '/members/:id' do
  @member = Member.find(params[:id])
  erb(:"../views/members/show")
end

# Create
post '/members' do
  @member = Member.new(params)
  @member.save()
  erb(:"../views/members/create")
end

# Edit
get '/members/:id/edit' do
  @member = Member.find(params[:id])
  erb(:"../views/members/edit")
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
