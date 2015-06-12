class Artwork
  
  attr_reader(:name, :description, :id, :museum_id)
  
  define_method(:initialize) do |attributes|
    @name = attributes.fetch(:name)
    @description = attributes.fetch(:description)
    @museum_id = attributes.fetch(:museum_id)
    @id = attributes.fetch(:id)
  end
  
  define_singleton_method(:all) do 
    all_artwork = DB.exec("SELECT * FROM artworks;")
    artworks = []
    all_artwork.each() do |artwork|
      name = artwork.fetch("name")
      description = artwork.fetch("description")
      id = artwork.fetch("id").to_i()
      museum_id = artwork.fetch("museum_id").to_i()
      artworks.push(Artwork.new(:name=> name, :description => description, :museum_id => museum_id, :id => id))
    end
    artworks
  end
  
  define_method(:save) do
    saved_artwork = DB.exec("INSERT INTO artworks (name, description, museum_id) VALUES ('#{@name}', '#{@description}', '#{@museum_id}') RETURNING id;")
    @id = saved_artwork.first().fetch("id").to_i() 
  end
  
  define_method(:==) do |another_artwork|
    self.name().==(another_artwork.name).&(self.description().==(another_artwork.description)).&(self.museum_id().==(another_artwork.museum_id)).&(self.id().==(another_artwork.id()))
  end
end