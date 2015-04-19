class PrivateMessage < ActiveRecord::Base
  belongs_to :conversation
end
