require('spec_helper')

describe(Museum) do 
  describe('#name') do 
    it('returns the name of an instance of Museum') do 
      test_museum = Museum.new(:name => "The Elliot") 
      expect(test_museum.name()).to(eq("The Elliot")) 
    end
  end
  
  describe('.all') do 
    it('returns an array of saved instances of Museum, starts out empty at first') do 
      expect(Museum.all()).to(eq([]))
    end
  end
end