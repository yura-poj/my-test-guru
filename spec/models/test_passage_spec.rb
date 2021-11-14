require 'rails_helper'

RSpec.describe TestPassage, type: :model do
  let(:test) { create(:test, questions: questions) }
  let(:test_passage) { create(:test_passage, test: test) }
  let(:questions) { [create(:question), create(:question)] }

  describe 'next question' do
    before do
      test_passage.accept!([])
    end

    context 'first question' do
      it 'should return next question' do
        expect(test_passage.current_question).to eq test.questions[1]
      end
    end

    context 'last question' do
      it 'should return next question - nil' do
        test_passage.send(:before_update_next_question)
        expect(test_passage.current_question).to eq test.questions[2]
      end
    end
  end
end
