class Profile < ActiveRecord::Base
  belongs_to :user

  before_create :set_slug

  def to_param
    slug
  end

  def set_slug
    self[:slug] = user.name.parameterize + Digest::SHA1.hexdigest([Time.now, rand].join)[0..5]
  end
end
