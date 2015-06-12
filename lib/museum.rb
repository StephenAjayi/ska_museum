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
      museums.push(Meseum.new(:name => name))
    end
    museums 
  end
end
  