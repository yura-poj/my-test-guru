require 'rails_helper'

RSpec.describe Question, type: :model do
  let(:question) { create(:question, body: 'what') }


  it 'return body' do
    expect(question.body).to eq('what')
  end
end
