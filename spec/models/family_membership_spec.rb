require 'rails_helper'

describe FamilyMembership do
  describe 'associations' do
    it { should belong_to(:user) }
    it { should belong_to(:family) }
  end

  describe 'validations' do
    it { should have_valid(:user).when(User.new)}
    it { should have_valid(:family).when(Family.new)}
  end
end


