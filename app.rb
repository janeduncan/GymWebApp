require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')
require_relative('sessions_controller')
require_relative('members_controller')
also_reload('./models/*')

get '/' do
  erb (:home)
end
