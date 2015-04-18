require 'rails_helper'

describe MessageFinder do
  describe '#correct_days_messages' do
    it 'returns todays message if params is nil' do
      message = FactoryGirl.create(:family_message)
      finder = MessageFinder.new(nil, message.family)
      expect(finder.correct_days_messages).to include message
    end

    it 'returns yesterdays message if params is 1' do
      message = FactoryGirl.create(:family_message, created_at: 1.day.ago)
      finder = MessageFinder.new(1, message.family)
      expect(finder.correct_days_messages).to include message
    end
  end

  describe '#general' do
    it 'returns messages with general category' do
      message = FactoryGirl.create(:family_message, category: 'general')
      finder = MessageFinder.new(nil, message.family)
      expect(finder.general).to include message
    end
  end

  describe '#event' do
    it 'returns messages with event category' do
      message = FactoryGirl.create(:family_message, category: 'event')
      finder = MessageFinder.new(nil, message.family)
      expect(finder.event).to include message
    end
  end

  describe '#chore' do
    it 'returns messages with chore category' do
      message = FactoryGirl.create(:family_message, category: 'chore')
      finder = MessageFinder.new(nil, message.family)
      expect(finder.chore).to include message
    end
  end

  describe '#sharable' do
    it 'returns messages with sharable category' do
      message = FactoryGirl.create(:family_message, category: 'sharable')
      finder = MessageFinder.new(nil, message.family)
      expect(finder.sharable).to include message
    end
  end

  describe '#page_one?' do
    it 'returns true if days_ago is equal to 0' do
      message = FactoryGirl.create(:family_message, category: 'sharable')
      finder = MessageFinder.new(0, message.family)
      expect(finder.page_one?).to eq true
    end

    it 'returns false if days_ago is not 0' do
      message = FactoryGirl.create(:family_message, category: 'sharable')
      finder = MessageFinder.new(1, message.family)
      expect(finder.page_one?).to eq false
    end
  end
end
