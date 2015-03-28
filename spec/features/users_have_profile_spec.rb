require 'rails_helper'

feature 'users can visit their profile' do
  scenario 'when a user gets created it redirects to profile page' do
    visit new_user_registration_path

    fill_in 'Email', with: 'spencer.dixon@gmail.com'
    fill_in 'Password', with: '12345678'
    fill_in 'Password confirmation', with: '12345678'
    click_on 'Sign up'

    expect(page).to have_content('Welcome, spencer.dixon@gmail.com')
  end
end
