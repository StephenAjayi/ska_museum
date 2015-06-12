require('spec_helper')

describe(Artwork) do 
  describe('#name') do 
    it('returns the name of an instance of Artwork') do 
      test_artwork = Artwork.new(:name => "Two Trees", :description => "Clay mold of two trees.")
      expect(test_artwork.name()).to(eq("Two Trees"))
    end
  end
  
  describe('#description') do 
    it('returns the description of an instance of Artwork ') do 
      test_artwork = Artwork.new(:name => "Halo", :description => "Black and white painting.")
      expect(test_artwork.description()).to(eq("Black and white painting."))
    end
  end
end
  