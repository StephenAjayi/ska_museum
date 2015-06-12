class Museum 
  
  attr_reader(:name)
  
  define_method(:initialize) do |attributes|
    @name = attributes.fetch(:name)
  end
  
  define_singleton_method(:all) do 
    museums = []
    all_museums =DB.exec("SELECT * FROM museums;")
    all_museums.each() do |museum|
      name = museum.fetch('name')
      museums.push(Museum.new(:name => name))
    end
    museums 
  end
  
  define_method(:==) do |another_museum|
    self.name().==(another_museum.name())
  end
  
  define_method(:save) do 
    saved_museum = DB.exec("INSERT INTO museums (name) VALUES ('#{@name}');")
  end
end


  