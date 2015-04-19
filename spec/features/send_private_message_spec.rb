require 'rails_helper'

feature 'send a private message to another family member' do
  context 'as an authorized user' do
    let(:user) { FactoryGirl.create(:user) }

    before :each do
      sign_in_as user
    end

    scenario 'I can create a message successfully' do
      recipient = FactoryGirl.create(:user)

      visit conversations_path

      select recipient, from: 'To'
      fill_in 'Body', with: 'Hey dude, lets go fishing!'
      click_on 'Send message'

      expect(page).to have_content('Successfully sent message')
    end
  end
end
