require 'rails_helper'

RSpec.feature "Deleting Carts" do
  let!(:pythonData) { Fabricate(:book, title: "Working with Data Structures in Python") }

  scenario "clear cart contents" do
    visit "/"

    expect(page).to have_link(pythonData.title)
    
    click_link pythonData.title
    click_button "Add to cart"
    expect(page).to have_button("Clear cart")

    click_button "Clear cart"
    
    expect(current_path).to eq(catalogs_path)
  end
end

