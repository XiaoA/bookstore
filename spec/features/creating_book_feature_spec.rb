require 'rails_helper'

RSpec.feature "Creating Books" do
  let!(:peachpit) {Fabricate(:publisher, name: 'Peachpit Press') }
  let!(:author1) {Fabricate(:author) }
  let!(:author2) {Fabricate(:author) }

  scenario "with valid inputs succeeds" do
    visit root_path
    click_link "Books", exact: true
    click_link "Add New Book"

    fill_in "Title", with: "Ruby for Awesome Web Development"
    fill_in "Isbn", with: "9872438732921"
    fill_in "Page count", with: 329
    fill_in "Price", with: 39.99
    fill_in "Description", with: "Learn how to use Ruby to build your next web project"
    fill_in "Published at", with: "2013-09-19"
    select "Peachpit Press", from: "Publisher"
    attach_file "Book Cover", "app/assets/images/itext.jpg"
    check author1.full_name
    check author2.full_name

    click_button "Create Book"

    expect(page).to have_content('Book has been created')
    
  end
end
