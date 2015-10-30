require 'rails_helper'

RSpec.feature "Creating users" do
  scenario "with valid credentials" do
    visit root_path

    click_link 'Sign Up'
    fill_in 'First name', with: 'John'
    fill_in 'Last name', with: 'Smith'
    fill_in 'Email', with: 'john@example.com'
    fill_in 'Password', with: 'password'
    fill_in 'Confirm Password', with: 'password'

    click_button 'Create User'

    expect(page).to have_content('User has been created.')
  end

    scenario "with invalid credentials" do
    visit root_path

    click_link 'Sign Up'
    fill_in 'First name', with: nil
    fill_in 'Last name', with: nil
    fill_in 'Email', with: 'password'
    fill_in 'Confirm Password', with: 'password'

    click_button 'Create User'

    expect(page).to have_content('User has not been created.')
  end
end
