class Artwork
  
  attr_reader(:name, :description, :museum_id)
  
  define_method(:initialize) do |attributes|
    @name = attributes.fetch(:name)
    @description = attributes.fetch(:description)
    @museum_id = attributes.fetch(:museum_id)
  end
  
  define_singleton_method(:all) do 
    all_artwork = DB.exec("SELECT * FROM artworks;")
    artworks = []
    all_artwork.each() do |art_work|
      name = artwork.fetch("name")
      description = artwork.fetch("description")
      museum_id = artwork.fetch("museum_id")
      art_works.push(Museum.new(:name=> name, :description => description, :museum_id => museum_id))
    end
    artworks
  end
end