class FamilyMessage < ActiveRecord::Base
  belongs_to :user
  belongs_to :family
  belongs_to :message_category
end
