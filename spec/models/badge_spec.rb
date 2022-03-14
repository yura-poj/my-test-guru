require 'rails_helper'

RSpec.describe Badge, type: :model do
  let(:user) { create(:user) }
  let(:test) { create(:test) }
  let(:questions) { [create(:question, test: test), create(:question, test: test), create(:question, test: test)]}
  let(:test_passage) { create(:test_passage, user: user, test: test, correct_questions: 3)}
  let(:badge) { create(:badge, action_type: :test, object_id: test.id) }

  describe 'earned_badges' do
    before do
      questions
      badge
      user
    end
    it 'should return earned badge' do
      puts test.questions.size, test_passage.success?
      puts '_____________'
      expect(Badge.earned_badges(test_passage)).to eq([badge])
    end
  end
end
