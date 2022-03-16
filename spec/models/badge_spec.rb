require 'rails_helper'

RSpec.describe Badge, type: :model do
  let(:user) { create(:user) }
  let(:test) { create(:test) }
  let(:questions) { [create(:question, test: test), create(:question, test: test), create(:question, test: test)]}
  let(:test_passage) { create(:test_passage, user: user, test: test, correct_questions: 2)}
  let(:badges) { [create(:badge, action_type: :test, object_id: test.id),
                  create(:badge, action_type: :category, object_id: test.category.id),
                  create(:badge, action_type: :level, object_id: Test.levels[test.level] ) ]  }

  describe 'earned_badges' do
    before do
      questions
      badges
    end

    it 'should return empty array' do
      expect(Badge.earned_badges(test_passage)).to eq([])
    end

    it 'should return earned badges' do
      test_passage.correct_questions += 1
      test_passage.save!

      expect(Badge.earned_badges(test_passage)).to eq(badges)
    end
  end
end
