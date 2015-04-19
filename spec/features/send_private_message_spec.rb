require 'rails_helper'

feature 'send a private message to another family member' do
  context 'as an authorized user' do
    let(:user) { FactoryGirl.create(:user) }

    before :each do
      sign_in_as user
    end

    scenario 'I can create a message successfully' do
      family = FactoryGirl.create(:family_membership, user: user).family
      recipient = FactoryGirl.create(:family_membership, family: family).user

      visit conversations_path

      select recipient.name, from: 'To'
      fill_in 'Subject', with: 'Boston marathon'
      fill_in 'Body', with: 'Hey dude, lets go fishing!'
      click_on 'Send message'

      expect(page).to have_content('Successfully sent message')
    end

    scenario 'I can respond to private messages' do
      family = FactoryGirl.create(:family_membership, user: user).family
      recipient = FactoryGirl.create(:family_membership, family: family).user

      visit conversations_path

      select recipient.name, from: 'To'
      fill_in 'Subject', with: 'Moving in together'
      fill_in 'Body', with: 'Wanna go visit that house?'
      click_on 'Send message'

      click_on 'Moving in together'

      fill_in 'Body', with: 'Not much wanna visit house?'
      click_on 'Reply'

      expect(page).to have_content('Successfully replied')
    end
  end
end
