require("sinatra")
require("sinatra/contrib/all")
require("pry-byebug")
require_relative("../models/booking")
require_relative("../models/session")
require_relative("../models/member")
also_reload("./models/*")

# Index
get '/bookings' do
  @bookings = Booking.all()
  erb(:"../views/bookings/index")
end

# New
get '/bookings/new' do
  @sessions = Session.all()
  @members = Member.all()
  erb(:"../views/bookings/new")
end

get '/bookings/:id' do
  @booking = Booking.find(params[:id])
  erb(:"../views/bookings/show")
end

# Create
post '/bookings' do
  @booking = Booking.new(params)
  @booking.save()
  erb(:"../views/bookings/create")
end

# Delete
post '/bookings/:id/delete' do
  booking = Booking.find(params[:id])
  booking.delete()
  redirect to '/bookings'
end
