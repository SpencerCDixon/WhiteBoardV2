require 'rails_helper'

feature 'create message on family message board' do
  context 'as an authorized user' do
    let(:user) { FactoryGirl.create(:user) }
    scenario 'user in family can create a message' do
      FactoryGirl.create(:family_membership, user: user)
      FactoryGirl.create(:message_category, name: "chores")
      FactoryGirl.create(:message_category, name: "general")
      FactoryGirl.create(:message_category, name: "events")
      FactoryGirl.create(:message_category, name: "sharables")
      sign_in_as user

      visit profile_path(user.profile)
      click_on 'Message Board'

      fill_in 'Message', with: 'Headed to the Red Sox game with matt tonight!'
      select 'Chores', from: 'Message category'
      click_on 'Create Message'

      expect(page).to have_content('Successfully created message')
      expect(page).to have_content('Headed to the Red Sox game with matt tonight!')
    end

    scenario 'user does not belong to a family' do
      sign_in_as user

      visit profile_path(user.profile)

      expect(page).to_not have_content('Message Board')
    end
  end
end
