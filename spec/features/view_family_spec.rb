require 'rails_helper'

feature 'view family details on profile' do
  context 'as an authorized user' do

    context 'without a family' do
      let(:user) { FactoryGirl.create(:user) }

      scenario 'I can see create family button' do
        sign_in_as user

        visit profile_path(user.profile)
        expect(page).to have_content('Create or join family')
      end
    end

    context 'with a family' do
      let(:user) { FactoryGirl.create(:family_membership).user }

      scenario 'family creation button goes away' do
        sign_in_as user

        visit profile_path(user.profile)
        expect(page).to_not have_content('Create or join family')
      end

      scenario 'can see other family members' do
        brother = FactoryGirl.create(:family_membership, family: user.family)
        sign_in_as user

        visit profile_path(user.profile)
        click_on 'Family Members'
        expect(page).to have_content(brother.user.name)
        expect(page).to have_content(user.name)
      end
    end
  end

  context 'as a visitor' do
    scenario 'I get redirected to login screen' do
      user = FactoryGirl.create(:user)
      visit profile_path(user.profile)
      expect(page).to have_content('You need to sign in or sign up before continuing.')
    end
  end
end
