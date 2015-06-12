require('spec_helper')

describe(Artwork) do 
  describe('#name') do 
    it('returns the name of an instance of Artwork') do 
      test_artwork = Artwork.new(:name => "Two Trees")
      expect(test_artwork.name()).to(eq("Two Trees"))
    end
  end
end
  