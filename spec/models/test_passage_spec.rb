require 'rails_helper'

RSpec.describe TestPassage, type: :model do
  let(:test) { create(:test) }
  let(:questions) { [create(:question, test: test), create(:question, test: test), create(:question, test: test)] }
  let(:test_passage) { create(:test_passage, test: test) }

  describe 'step' do
    it 'step need to be 1' do
      expect(test_passage.step).to eq(1)
    end
  end

  describe 'time out?' do
    it 'should return false' do
      expect(test_passage.time_out?).to eq false 
    end
  end

  describe 'next question' do
    before do
      questions
      2.times { test_passage.accept!([]) }
    end

    context 'third question' do
      it 'should return third question' do
        expect(test_passage.current_question).to eq test.questions[2]
      end

      it 'should return current step' do
        expect(test_passage.step).to eq(3)
      end
    end

  end
end
