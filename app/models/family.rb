class Family < ActiveRecord::Base
  has_many :family_memberships
  has_many :users, through: :family_memberships

  validates :name, presence: true
end
