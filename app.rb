require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')
require_relative('./models/session')
require_relative('./models/gymclass')
also_reload('./models/*')

get '/index' do
  @sessions = Session.all()
  erb (:index)
end
