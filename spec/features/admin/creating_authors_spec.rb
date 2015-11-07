require 'rails_helper'

RSpec.feature 'Creating Authors' do
  let(:admin) { Fabricate(:admin) }
  let(:user) { Fabricate(:user) }

  before { sign_in_as admin }

  scenario 'access to non-admin users not allowed' do
    deny_access_to_non_admins(user, 'Authors')
  end

  scenario 'create a valid author' do
    visit root_path
    click_link 'Authors'
    click_link 'Add New Author'

    fill_in 'First name', with: 'Oliver'
    fill_in 'Last name', with: 'Queen'
    click_button 'Create Author'

    expect(page).to have_content('Author has been created.')
  end

  scenario 'create a invalid author' do
    visit root_path
    click_link 'Authors'
    click_link 'Add New Author'

    fill_in 'First name', with: ''
    fill_in 'Last name', with: 'Queen'
    click_button 'Create Author'

    expect(page).to have_content('Author has not been created.')
  end
end
