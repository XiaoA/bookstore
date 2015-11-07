require 'rails_helper'

RSpec.feature "Searching for Books" do
  let!(:iPhone) { Fabricate(:book, title: 'The iPhone Users Guide') }
  let!(:railsTest) { Fabricate(:book, title: 'Testing Rails Apps') }

  scenario "with existing title returns all of the books" do
    visit root_path
    fill_in "search_word", with: "Rails"
    click_button "Search"

    expect(page).to have_content(railsTest.title)
    expect(page).not_to have_content(iPhone.title)
    expect(current_path).to eq(search_catalogs_path)
  end
end
