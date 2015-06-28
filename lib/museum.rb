class Museum 
  
  attr_reader(:name, :id)
  
  define_method(:initialize) do |attributes|
    @name = attributes.fetch(:name)
    @id = attributes.fetch(:id)
  end
  
  define_singleton_method(:all) do 
    museums = []
    all_museums =DB.exec("SELECT * FROM museums;")
    all_museums.each() do |museum|
      name = museum.fetch('name')
      id = museum.fetch('id').to_i()
      museums.push(Museum.new(:name => name, :id => id))
    end
    museums 
  end
  
  define_method(:==) do |another_museum|
    self.name().==(another_museum.name()).&(self.id().==(another_museum.id()))
  end
  
  define_method(:save) do 
    saved_museum = DB.exec("INSERT INTO museums (name) VALUES ('#{@name}') RETURNING id;")
    @id = saved_museum.first().fetch('id').to_i()
  end
  
  define_singleton_method(:find) do |id|
    found_museum = nil
    museum_to_find = DB.exec("SELECT * FROM museums WHERE id = #{id};")
    name = museum_to_find.first().fetch("name")
    found_museum = Museum.new(:name => name, :id => id)
  end
  
  define_method(:delete) do
    DB.exec("DELETE FROM museums * WHERE id = #{@id};")
    DB.exec("DELETE FROM artworks * WHERE museum_id = #{@id}")
    
  end
  
  define_method(:update) do |attributes|
    updated_name = attributes.fetch(:name, @name)
    if updated_name.==("")
    else
      @name = updated_name
    end
    updated_museum = DB.exec("UPDATE museums SET name = '#{@name}' WHERE id = #{@id};")
  end
  
  define_method(:artworks) do 
    museum_artworks = DB.exec("SELECT * FROM artworks WHERE museum_id = #{@id};")
    artworks = [] 
    museum_artworks.each do |museum_artwork|
      name = museum_artwork.fetch("name")
      description = museum_artwork.fetch("description")
      museum_id = museum_artwork.fetch("museum_id").to_i()
      id = museum_artwork.fetch("id").to_i()
      artworks.push(Artwork.new(:name => name, :description => description, :museum_id => museum_id , :id => id))
    end
    artworks
  end
end
      
   