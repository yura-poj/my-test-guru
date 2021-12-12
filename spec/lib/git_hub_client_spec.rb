require 'rails_helper'

RSpec.describe GitHubClient, type: :integration do
  let(:git_hub_client) { GitHubClient.new }
  describe 'initialize' do
    it 'check client' do
      expect(git_hub_client.nil?).to be false
    end
  end
end
