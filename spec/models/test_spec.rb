require 'rails_helper'

RSpec.describe Test, type: :model do
  let(:category) { create(:category) }
  let(:test) { create(:test, title: 'test1', category: category) }


  it 'return title' do
    expect(test.title).to eq('test1')
  end
end
