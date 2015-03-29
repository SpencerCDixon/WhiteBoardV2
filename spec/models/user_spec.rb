require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#has_family?' do
    it 'returns true if yes' do
      user = FactoryGirl.create(:family_membership).user

      expect(user.has_family?).to eq true
    end

    it 'returns false if no' do
      user = FactoryGirl.create(:user)

      expect(user.has_family?).to eq false
    end
  end

  describe '#email_verified?' do
    it 'returns false when there is a default email ' do
      user = FactoryGirl.create(:user, email: 'change@me-slkjdf.com')
      expect(user.email_verified?).to eq false
    end

    it 'returns true when there is a good email' do
      user = FactoryGirl.create(:user)
      expect(user.email_verified?).to eq true
    end
  end
end
