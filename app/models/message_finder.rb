class MessageFinder
  attr_reader :family, :days_ago
  def initialize(days_ago, family)
    @days_ago = days_ago.to_i
    @family = family
  end

  def correct_days_messages
    if days_ago
      family.family_messages.where(created_at: days_ago.days.ago.beginning_of_day..days_ago.days.ago.end_of_day )
    else
      family.family_messages.where(created_at: Date.today.beginning_of_day..Date.today.end_of_day )
    end
  end

  def page_one?
    days_ago == 0
  end

  def general
    correct_days_messages.where(category: 'general')
  end

  def event
    correct_days_messages.where(category: 'event')
  end

  def chore
    correct_days_messages.where(category: 'chore')
  end

  def sharable
    correct_days_messages.where(category: 'sharable')
  end
end
