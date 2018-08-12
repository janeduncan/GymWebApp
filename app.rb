require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')
require_relative('./models/session')
require_relative('./models/member')
require_relative('./models/booking')
also_reload('./models/*')

get '/' do
  erb (:home)
end
