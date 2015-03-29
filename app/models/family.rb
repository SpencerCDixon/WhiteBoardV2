class Family < ActiveRecord::Base
  has_many :family_memberships
  has_many :users, through: :family_memberships
  has_many :family_messages

  validates :name, presence: true

  def general_messages
    general = MessageCategory.find_by(name: 'general')
    family_messages.where(message_category_id: general.id)
  end

  def chore_messages
    chores = MessageCategory.find_by(name: 'chores')
    family_messages.where(message_category_id: chores.id)
  end

  def event_messages
    events = MessageCategory.find_by(name: 'events')
    family_messages.where(message_category_id: events.id)
  end

  def sharable_messages
    sharables = MessageCategory.find_by(name: 'sharables')
    family_messages.where(message_category_id: sharables.id)
  end
end
