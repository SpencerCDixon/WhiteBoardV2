class FamilyInvitation < ActiveRecord::Base
  belongs_to :family
  belongs_to :user

  validates :email,
    presence: true,
    uniqueness: true

  validates :family,
    presence: true

  scope :unredeemed, -> { where(user_id: nil) }

  before_create :generate_token

  def to_param
    token
  end

  def send_invite
    self.sent_at = Date.today
    if save
      FamilyInvitationMailer.invite(self).deliver_now
      true
    end
  end

  private

  def generate_token
    self.token = Digest::SHA1.hexdigest([Time.now, rand].join)
  end
end
