class MessageCategory < ActiveRecord::Base
  CATEGORIES = [ "chores", "general", "events", "sharables"]
  has_many :family_messages

  validates :name, inclusion: { in: CATEGORIES }
end
