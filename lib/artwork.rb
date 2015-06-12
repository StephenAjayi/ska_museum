class Artwork
  
  attr_reader(:name, :description, :museum_id)
  
  define_method(:initialize) do |attributes|
    @name = attributes.fetch(:name)
    @description = attributes.fetch(:description)
    @museum_id = attributes.fetch(:museum_id)
  end
end