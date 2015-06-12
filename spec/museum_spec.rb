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
    it('evealuates two instances of Museum as equal if they have the same name') do 
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
end
