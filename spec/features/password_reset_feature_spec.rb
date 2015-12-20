require 'rails_helper'

RSpec.feature "Resetting Users' Password" do
  let(:sherlock) { Fabricate(:user, email: 'sherlock@example.com' ) }

  scenario 'with valid email address' do
    visit root_path

    click_link 'Sign in'
    click_link 'Forgotten Password?'

    fill_in 'Email Address', with: sherlock.email
    click_button 'Reset Password'

    expect(page).to have_content('An email with instructions')
  end

  scenario 'with invalid email address' do
    visit root_path

    click_link 'Sign in'
    click_link 'Forgotten Password?'

    fill_in 'Email Address', with: 'james@example.com'
    click_button 'Reset Password'

    expect(page).to have_content('Email invalid.')
  end

  scenario 'with no email address' do
    visit root_path

    click_link 'Sign in'
    click_link 'Forgotten Password?'

    fill_in 'Email Address', with: ''
    click_button 'Reset Password'

    expect(page).to have_content("Email can't be blank.")
  end

end
