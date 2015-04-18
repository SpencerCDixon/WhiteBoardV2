class FamilyMessage < ActiveRecord::Base
  CATEGORIES = %w[general sharable event chore]
  belongs_to :user
  belongs_to :family

  validates :category,
    inclusion: { in: %w{general sharable event chore} }
end
