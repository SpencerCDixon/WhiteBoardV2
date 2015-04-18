require 'rails_helper'

feature 'message board only shows current day' do
  context 'as an authorized user' do
    let(:user) { FactoryGirl.create(:user) }
    before :each do
      sign_in_as user
    end

    scenario 'I just see messages for today' do
      family = FactoryGirl.create(:family_membership, user: user).family
      FactoryGirl.create(:family_message,
                         message: 'This should show for today',
                         family: family,
                         user: user)
      FactoryGirl.create(:family_message,
                         message: 'This should not be visible',
                         family: family,
                         user: user,
                         created_at: 1.day.ago)

      visit family_family_messages_path(family.id)
      expect(page).to have_content 'This should show for today'
      expect(page).to_not have_content 'This should not be visible'
    end

    scenario 'I can see yesterdays messages' do
      family = FactoryGirl.create(:family_membership, user: user).family
      FactoryGirl.create(:family_message,
                         message: 'This should show for today',
                         family: family,
                         user: user)
      FactoryGirl.create(:family_message,
                         message: 'This should not be visible',
                         family: family,
                         user: user,
                         created_at: 1.day.ago)

      visit family_family_messages_path(family.id)
      expect(page).to have_content 'This should show for today'
      expect(page).to_not have_content 'This should not be visible'

      click_on 'previous'
      expect(page).to_not have_content 'This should show for today'
      expect(page).to have_content 'This should not be visible'
    end
  end

  context 'as a visitor' do
    scenario 'I get redirected'
  end
end
