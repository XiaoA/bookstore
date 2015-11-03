require 'rails_helper'

RSpec.feature 'Signing Out Users' do
  let(:user) { Fabricate(:user, email: 'john@example.com') }

  before { sign_in_as user }
  
  scenario do
    visit root_path

    click_link 'Sign out'
    expect(page).to have_content('You have successfully signed out.')
    expect(current_path).to eq(root_path)
    expect(page).not_to have_content("Sign out")
  end
end
