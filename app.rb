require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')
require_relative('./controllers/sessions_controller')
require_relative('./controllers/members_controller')
require_relative('./controllers/bookings_controller')
also_reload('./models/*')

get '/' do
  erb (:home)
end

get '/trainers' do
  erb (:trainers)
end
