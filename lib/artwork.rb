class Artwork
  
  attr_reader(:name, :description)
  
  define_method(:initialize) do |attributes|
    @name =attributes.fetch(:name)
    @description =attributes.fetch(:description)
  end
end