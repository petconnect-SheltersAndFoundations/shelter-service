require 'sinatra'
require 'sinatra/json'
require 'dotenv/load'
require_relative './db/connect'
require_relative './controllers/shelters_controller'

set :port, ENV['PORT'] || 3018
set :bind, '0.0.0.0'

get '/' do
  json message: '🏠 Shelter Service funcionando'
end
