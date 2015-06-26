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

get('/museum/:id/edit') do 
  id = params.fetch('id').to_i()
  @museum = Museum.find(id)
  erb(:museum_edit)
end

patch('/museum/:id') do 
  new_name = params.fetch('updated_name')
  id = params.fetch('id').to_i()
  @museum = Museum.find(id)
  @museum.update(new_name)
  erb(:museum)
end

delete('/museum/:id') do 
  id = params.fetch('id').to_i()
  @museum = Museum.find(id)
  @museum.delete()
  @museums = Museum.all()
  erb(:index)
end

get('/artwork/:id/edit') do 
  id = params.fetch('id').to_i()
  @artwork = Artwork.find(id)
  @museums = Museum.all()
  erb(:artwork_edit)
end

patch('/artwork/:id') do
  new_name = params.fetch('updated_name')
  new_description = params.fetch('updated_description')
  id = params.fetch('id')
  @artwork = Artwork.find(id)
  @artwork.update(:name => new_name, :description => new_description)
  redirect back
end 

patch('/artwork/:id/move') do 
  new_museum = params.fetch('updated_museum_id')
  id = params.fetch('id').to_i()
  @artwork = Artwork.find(id)
  @artwork.update(:name => @artwork.name(), :description => @artwork.description, :museum_id => new_museum)
  @museums =Museum.all()
  erb(:index)
end 
  