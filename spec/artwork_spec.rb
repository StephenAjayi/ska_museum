require('spec_helper')

describe(Artwork) do 
  describe('#name') do 
    it('returns the name of an instance of Artwork') do 
      test_artwork = Artwork.new(:name => "Two Trees", :description => "Clay mold of two trees.", :museum_id => 1, :id => nil)
      expect(test_artwork.name()).to(eq("Two Trees"))
    end
  end
  
  describe('#description') do 
    it('returns the description of an instance of Artwork ') do 
      test_artwork = Artwork.new(:name => "Halo", :description => "Black and white painting.", :museum_id => 1, :id => nil)
      expect(test_artwork.description()).to(eq("Black and white painting."))
    end
  end
    
  describe("#museum_id") do 
    it('returns the id of the museum an instance of Artwork is associated with') do 
      test_artwork = Artwork.new(:name => "Moonlight", :description => "Marble sculpture.", :museum_id => 1, :id => nil)
      expect(test_artwork.museum_id()).to(eq(1))
    end
  end
  
  describe('.all') do 
    it('returns an array of saved instances of Artwork, starts empty at first') do 
      expect(Artwork.all()).to(eq([]))
    end
  end
  
  describe('#save') do 
    it('saves an instance of Artwork into an array') do 
      test_artwork = Artwork.new(:name => "painted Corners", :description => "Modern installation.", :museum_id => 1, :id => nil)
      test_artwork.save()
      expect(Artwork.all()).to(eq([test_artwork]))
    end
  end
  
  describe('#==') do 
    it('evaluates two instances of Artwork as equal if they have the same name, description and museum_id') do
      test_artwork = Artwork.new(:name => "painted Corners", :description => "Modern installation.", :museum_id => 1, :id => nil)
      test_artwork2 = Artwork.new(:name => "painted Corners", :description => "Modern installation.", :museum_id => 1, :id => nil)
      expect(test_artwork).to(eq(test_artwork2))
    end
  end
   
  describe('#id') do 
    it('returns the id of an instance of Artwork ') do 
      test_artwork = Artwork.new(:name => "Halo", :description => "Black and white painting.", :museum_id => 1, :id => nil)
      test_artwork.save()  
      expect(test_artwork.id()).to(be_an_instance_of(Fixnum))
    end
  end
end
               
 
       
    
 