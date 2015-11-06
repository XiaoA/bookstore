require 'rails_helper'

RSpec.feature 'Showing user profile' do
  let!(:user) { Fabricate(:user, first_name: 'Sherlock', last_name: 'Holmes', email: 'sherlock@example.com') }
  let(:admin) { Fabricate(:admin) }

  before do
    sign_in_as admin
  end
  
  scenario do
    visit root_path
    click_link 'Users'
    print page.html
    click_link user.email
    within("h3.titles") do
      expect(page).to have_content('Sherlock Holmes')
    end
    within("#first-name") do
      expect(page).to have_content('Sherlock')
    end
    within("#last-name") do
      expect(page).to have_content('Holmes')
    end
    within("#email") do
      expect(page).to have_content('sherlock@example.com')
    end
  end
end
