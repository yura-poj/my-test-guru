require 'rails_helper'

RSpec.describe Badge, type: :model do
  let(:user) { create(:user) }
  let(:test) { create(:test) }
  let!(:questions) { create_list(:question, 3, test: test) }
  let(:test_passage) { create(:test_passage, user: user, test: test, correct_questions: 2)}
  let!(:badges) { [create(:badge, action_type: :test, test: test),
                  create(:badge, action_type: :category, category: test.category),
                  create(:badge, action_type: :level, test: test ) ]  }

  describe 'earned_badges' do
    it 'should return empty array' do
      expect(BadgeService.new(test_passage: test_passage).earned_badges).to eq([])
    end

    it 'should return earned badges' do
      test_passage.correct_questions += 1
      test_passage.save!

      expect(BadgeService.new(test_passage: test_passage).earned_badges).to eq(badges)
    end
  end
end
