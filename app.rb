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

get '/images/:file' do
  send_file File.expand_path(params[:file], settings.public_folder)
end
