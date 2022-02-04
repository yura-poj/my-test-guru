require 'rails_helper'

RSpec.describe Question, type: :model do
  let(:test) { create(:test) }
  let(:question) { create(:question, body: 'what', test:test) }

  it 'return body' do
    expect(question.body).to eq('what')
  end
end
