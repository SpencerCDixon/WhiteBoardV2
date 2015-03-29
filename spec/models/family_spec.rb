require 'rails_helper'

describe Family do
  describe 'associations' do
    it { should have_many(:users).through(:family_memberships) }
    it { should have_many(:family_memberships) }
  end

  describe 'validations' do
    it { should have_valid(:name).when('Spencer', 'Emily Wadsworth')}
    it { should_not have_valid(:name).when(nil, '') }
  end
end
