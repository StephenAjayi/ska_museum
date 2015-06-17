require('sinatra')
require('sinatra/reloader')
also_reload('/lib/**/*.rb')
require('pg')
require('./lib/museum')
require('./lib/artwork')

DB = PG.connect(:dbname => "museum_tracker")

get('/') do 
  @museums = Museum.all()
  erb(:index)
end

post('/museums') do 
  museum_name = params.fetch('museum_name')
  @museum = Museum.new(:name => museum_name, :id => nil)
  @museum.save()
  @museums = Museum.all()
  redirect back
end

post('/artwork') do
  @museums = Museum.all()
  artwork_name = params.fetch('artwork_name')
  artwork_description = params.fetch('artwork_description')
  museum_id = params.fetch('museum_id')
  @artwork = Artwork.new(:name => artwork_name, :description => artwork_description, :museum_id => museum_id, :id => nil)
  @artwork.save()
  redirect back
end

get('/museum/:id') do
  id = params.fetch('id')
  @museum = Museum.find(id.to_i)
  erb(:museum)
end



