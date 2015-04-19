class Conversation < ActiveRecord::Base
  has_many :private_messages
  has_many :participants
  has_many :users, through: :participants
end
