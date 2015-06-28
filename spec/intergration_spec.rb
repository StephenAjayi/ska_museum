require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('add new museum', {:type => :feature}) do
  it('creates a new museum') do 
    visit('/') 
    fill_in('museum_name', :with => "The Alex Museum")
    click_button('Add Museum')
    expect(page).to have_content("The Alex Museum")
  end
end

describe('adds a artwork to a museum', {:type => :feature}) do
  it('creates a new artwork') do 
    visit('/') 
    museum = Museum.new(:name => "Portland Museum Of Art", :id => nil)
    museum.save()
    visit('/')
    select "Portland Museum Of Art", :from => "museum_id"
    fill_in('artwork_name', :with => "Moved")
    fill_in('artwork_description', :with => "Black and white painting")
    click_button('Add Artwork')
    click_link("Portland Museum Of Art")
    expect(page).to have_content("Moved")
  end
end

describe('updates a saved museum', {:type => :feature}) do
  it("updates a museum's name") do 
    visit('/') 
    museum = Museum.new(:name => "Portland Museum Of Art", :id => nil)
    museum.save()
    visit('/')
    click_link("Edit Portland Museum Of Art")
    fill_in('updated_name', :with => "The Addy Museum")
    click_button('Update Museum')
    expect(page).to have_content("The Addy Museum")
  end 
end

describe('deletes saved museum', {:type => :feature}) do
  it('deletes museum from database') do 
    visit('/') 
    museum = Museum.new(:name => "Portland Museum Of Art", :id => nil)
    museum.save()
    visit('/')
    click_link("Edit Portland Museum Of Art")
    click_button('Delete Museum')
    expect(page).to have_content("There are no museums yet, add one below.")
  end 
end

describe("updates an artwork's name and description", {:type => :feature}) do
  it('changes name and description ') do 
    visit('/') 
    museum = Museum.new(:name => "Portland Museum Of Art", :id => nil)
    museum.save()
    artwork = Artwork.new(:name =>"Swan", :description => "Black and white painting", :museum_id => museum.id(), :id => nil)
    artwork.save()
    visit('/')
    click_link("Portland Museum Of Art")
    click_link("Edit Swan")
    fill_in('updated_name', :with => "Moved")
    fill_in('updated_description', :with => "Black and white painting")
    click_button('Update Swan')
    expect(page).to have_content("Name: Moved Description: Black and white painting")
  end 
end

describe("moves an artwork to a different museum", {:type => :feature}) do
  it('changes museum an artwork belongs to') do 
    visit('/') 
    museum = Museum.new(:name => "Portland Museum Of Art", :id => nil)
    museum.save()
    museum2 = Museum.new(:name => "The Abby Museum", :id => nil)
    museum2.save()
    artwork = Artwork.new(:name =>"Swan", :description => "Black and white painting", :museum_id => museum.id(), :id => nil)
    artwork.save()
    visit('/')
    click_link("Portland Museum Of Art")
    click_link("Edit Swan")
    select "The Abby Museum", :from => "updated_museum_id"
    click_button('Move Swan')
    click_link('The Abby Museum')
    expect(page).to have_content("Swan Black and white painting")
  end 
end

describe("Deletes an artwork from a museum", {:type => :feature}) do
  it('removes an artwork from a museum') do 
    visit('/') 
    museum = Museum.new(:name => "Portland Museum Of Art", :id => nil)
    museum.save()
    artwork = Artwork.new(:name =>"Swan", :description => "Black and white painting", :museum_id => museum.id(), :id => nil)
    artwork.save()
    visit('/')
    click_link("Portland Museum Of Art")
    click_link("Edit Swan")
    click_button('Delete Swan')
    expect(page).to have_content("This museum has no pieces in it's gallery, add a piece here.")
  end 
end