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
    self.name().==(another_museum.name())
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
    museum_to_delete = DB.exec("DELETE FROM museums * WHERE id = #{@id};")
  end
  
  define_method(:update) do |updated_name|
    updated_museum = DB.exec("UPDATE museums SET name = '#{updated_name}' WHERE id = #{@id} RETURNING name;")
    @name = updated_museum.first().fetch("name")
  end
end
  

