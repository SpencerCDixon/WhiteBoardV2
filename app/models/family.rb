class Family < ActiveRecord::Base
  has_many :family_memberships
  has_many :users, through: :family_memberships
  has_many :family_messages
  has_many :family_invitations

  validates :name, presence: true

end
