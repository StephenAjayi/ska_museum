require('spec_helper')

describe(Artwork) do 
  describe('#name') do 
    it('returns the name of an instance of Artwork') do 
      test_artwork = Artwork.new(:name => "Two Trees", :description => "Clay mold of two trees.", :museum_id => 1)
      expect(test_artwork.name()).to(eq("Two Trees"))
    end
  end
  
  describe('#description') do 
    it('returns the description of an instance of Artwork ') do 
      test_artwork = Artwork.new(:name => "Halo", :description => "Black and white painting.", :museum_id =>1)
      expect(test_artwork.description()).to(eq("Black and white painting."))
    end
  end
  
  describe("#museum_id") do 
    it('returns the id of the museum an instance of Artwork is associated with') do 
      test_artwork = Artwork.new(:name => "Moonlight", :description => "Marble sculpture.", :museum_id => 1)
      expect(test_artwork.museum_id()).to(eq(1))
    end
  end
  
  describe('.all') do 
    it('returns an array of saved instances of Artwork, starts empty at first') do 
      expect(Artwork.all()).to(eq([]))
    end
  end
end
