require('spec_helper')

describe(Museum) do 
  describe('#name') do 
    it('returns the name of an instance of Museum') do 
      test_museum = Museum.new(:name => "The Elliot", :id => nil) 
      expect(test_museum.name()).to(eq("The Elliot",)) 
    end
  end
  
  describe('.all') do 
    it('returns an array of saved instances of Museum, starts out empty at first') do 
      expect(Museum.all()).to(eq([]))
    end
  end
  
  describe('#==') do 
    it('evealuates two instances of Museum as equal if they have the same name and id') do 
      test_museum = Museum.new(:name => "Wyatt", :id => nil )
      test_museum2 = Museum.new(:name => "Wyatt", :id => nil )
      expect(test_museum).to(eq(test_museum2))
    end
  end
  
  describe('#save') do 
    it('saves an instance of Museum to an array') do 
      test_museum = Museum.new(:name => "Harrison", :id => nil )
      test_museum.save()
      expect(Museum.all()).to(eq([test_museum]))
    end
  end
  
  describe('#id') do 
    it('returns the id number of an instance of Museum ') do 
      test_museum = Museum.new(:name => "Sterling", :id => nil)
      test_museum.save()
      expect(test_museum.id()).to(be_an_instance_of(Fixnum))
    end
  end
  
  describe('find') do 
    it('returns an instance of Museum by it"S id') do 
      test_museum = Museum.new(:name => "Modern", :id=> nil)
      test_museum.save()
      test_museum2 = Museum.new(:name => "Classic", :id => nil)
      test_museum2.save()
      expect(Museum.find(test_museum.id())).to(eq(test_museum))
    end
  end
  
  describe("#delete") do 
    it("Deletes an instance of Museum form an array of saved museums") do 
      test_museum = Museum.new(:name => "The Addy", :id => nil )
      test_museum.save()
      test_museum2 = Museum.new(:name => "Lux", :id => nil)
      test_museum2.save()
      test_museum.delete()
      expect(Museum.all()).to(eq([test_museum2]))
    end
    
    it('deletes the Artwork of an instance of museum as well') do
      test_museum = Museum.new(:name => "Hoyt Museum", :id => nil)
      test_museum.save()
      test_artwork = Artwork.new(:name => "Moonlight Dance", :description => "Modern painting.", :museum_id => test_museum.id(), :id => nil)
      test_artwork.save()
      test_artwork2 = Artwork.new(:name => "Islands", :description => "Modern painting.", :museum_id => test_museum.id(), :id => nil)
      test_artwork2.save()
      test_museum.delete()
      expect(Artwork.all()).to(eq([]))
    end
  end
  
  describe('#update') do 
    it('changes the name of a save instance of museum') do 
      test_museum = Museum.new(:name => "Indy", :id => nil)
      test_museum.save()
      test_museum.update(:name =>"Museum of Art")
      expect(test_museum.name()).to(eq("Museum of Art"))
    end
    
    it('does not allow name to be updated to an empty string') do 
      test_museum = Museum.new(:name => "Indy", :id => nil)
      test_museum.save()
      test_museum.update(:name =>"")
      expect(test_museum.name()).to(eq("Indy"))
    end
  end
  
  describe('#artworks') do 
    it("returns all instances of artwork associated with a museum's id ") do 
      test_museum = Museum.new(:name => "The Gregory Museum", :id => nil)
      test_museum.save()
       test_artwork = Artwork.new(:name => "Moonlight Dance", :description => "Modern painting.", :museum_id => test_museum.id(), :id => nil)
      test_artwork.save()
      test_artwork2 = Artwork.new(:name => "Moonlight Run", :description => "Modern painting.", :museum_id => test_museum.id(), :id => nil)
      test_artwork2.save()
      expect(test_museum.artworks()).to(eq([test_artwork, test_artwork2]))
    end
  end
end
