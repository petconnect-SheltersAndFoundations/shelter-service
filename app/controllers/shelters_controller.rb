require 'sinatra'
require 'sinatra/json'
require_relative '../models/shelterModels'

# GET all shelters
get '/api/v1/shelters' do
  shelters = Shelter.all
  json shelters
end

# POST create shelter
post '/api/v1/shelters' do
  data = JSON.parse(request.body.read)
  shelter = Shelter.create(data)
  json shelter
end

# PUT update shelter
put '/api/v1/shelters/:id' do
  data = JSON.parse(request.body.read)
  shelter = Shelter.update(params[:id], data)
  json shelter
end

# DELETE delete shelter
delete '/api/v1/shelters/:id' do
  Shelter.delete(params[:id])
  status 204
end
