require 'rails_helper'

feature 'creating a family' do
  context 'as an authorized user' do
    let(:user) { FactoryGirl.create(:user) }

    before :each do
      sign_in_as user
    end

    scenario 'I can create a family if I dont belong to one' do
      click_on 'Create or join family'

      fill_in 'Name', with: 'Dixon'
      click_on 'Create Family'

      expect(page).to have_content('Successfully created family')
    end

    scenario 'I get alerted if already in a family' do
      FactoryGirl.create(:family_membership, user: user)

      click_on 'Create or join family'

      fill_in 'Name', with: 'Dixon'
      click_on 'Create Family'

      expect(page).to have_content("You're already in a family!")
    end
  end

  context 'as a visitor' do
    scenario 'I get redirected to sign in' do
      visit new_family_path
      expect(page).to have_content('You need to sign in or sign up before continuing.')
    end
  end
end
