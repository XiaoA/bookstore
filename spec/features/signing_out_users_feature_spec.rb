require 'rails_helper'

RSpec.feature 'Signing Out Users' do
  let!(:user) { Fabricate(:user, email: 'john@example.com') }

  scenario 'successful signout' do
    visit root_path

    click_link 'Sign out'
    expect(page).to have_content('You have successfully signed out.')
  end
end
