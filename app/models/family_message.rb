class FamilyMessage < ActiveRecord::Base
  belongs_to :user
  belongs_to :family
end