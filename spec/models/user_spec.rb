require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { create(:user, email: 'dk@gmail.com') }

  it 'return email of user' do
    expect(user.email).to eq('dk@gmail.com')
  end
end
