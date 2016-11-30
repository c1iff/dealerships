require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('add new dealership route', {:type => :feature}) do
  it ('adds a new dealership and displays the success page') do
    visit('/')
    click_link('Add New Dealership')
    fill_in('name', :with => 'Bobs Dealership')
    click_button('Add Dealership')
    expect(page).to have_content('Success!')
  end
end

describe('view all dealerships route', {:type => :feature}) do
  it('shows all dealerships after one has been created') do
    visit('/')
    click_link('Add New Dealership')
    fill_in('name', :with => 'Bobs Dealership')
    click_button('Add Dealership')
    click_link('See Dealership List')
    expect(page).to have_content('Bobs Dealership')
  end
end

describe('add car route', {:type => :feature}) do
  it('adds a car to a dealership') do
    visit('/')
    click_link('Add New Dealership')
    fill_in('name', :with => 'Bills Dealership')
    click_button('Add Dealership')
    click_link('See Dealership List')
    click_link('Bills Dealership')
    click_link('Add a new vehicle')
    fill_in('make', :with => "Honda")
    fill_in('model', :with => "Civic")
    fill_in('year', :with => "2008")
    click_button('Add Vehicle')
    expect(page).to have_content('Success!')
  end

  it('adds a car to a dealership') do
    visit('/')
    click_link('Add New Dealership')
    fill_in('name', :with => 'Roys Dealership')
    click_button('Add Dealership')
    click_link('See Dealership List')
    click_link('Roys Dealership')
    click_link('Add a new vehicle')
    fill_in('make', :with => "Honda")
    fill_in('model', :with => "Civic")
    fill_in('year', :with => "2008")
    click_button('Add Vehicle')
    click_link('See Dealership List')
    click_link('Roys Dealership')
    click_link('Honda Civic 2008')
    expect(page).to have_content('Honda Civic 2008')
  end
end
