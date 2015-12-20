require 'rails_helper'

RSpec.feature 'Creating Orders' do
  let!(:book) { Fabricate(:book) }
  let!(:user) { Fabricate(:user) }

  before do
    sign_in_as user
  end

  scenario 'create a valid book', js: true do

    visit root_path

    click_link 'Catalogs', exact: false
    click_link book.title
    click_button 'Add to cart'
    click_button 'Checkout', match: :first

    fill_in 'Credit Card Number', with: '4242424242424242'
    fill_in 'Security Code', with: '123'
    select '12 - December', from: "date_month"
    select '2018', from: "date_year"
    click_button 'Create Order'

    expect(page).to have_content('Your order has been submitted.')
  end
end
