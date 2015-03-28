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
end
