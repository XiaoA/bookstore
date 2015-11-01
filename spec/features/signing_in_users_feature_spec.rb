require 'rails_helper'

RSpec.feature 'Signing In Users' do
  let!(:user) { Fabricate(:user, email: 'john@example.com') }

  scenario 'successful signin' do
    visit root_path

    click_link 'Sign in'

    fill_in 'Email Address', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Sign in'

    expect(page).to have_content('Sign in successful')
  end

  scenario 'unsuccessful signin' do
    visit root_path

    click_link 'Sign in'

    fill_in 'Email Address', with: user.email
    fill_in 'Password', with: ''
    click_button 'Sign in'

    expect(page).to have_content('There was a problem with your email or password.')
  end

end
