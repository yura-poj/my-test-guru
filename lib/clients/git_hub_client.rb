class GitHubClient
  ROOT_ENDPOINT = 'https://api.github.com'

  def initialize
    @client = setup_http_client
  end

  def create_gist(params)
    @client.create_gist params
  end

  private

  def setup_http_client
    #Faraday.new(url: ROOT_ENDPOINT)
    Octokit::Client.new access_token: ENV['ACCESS_GITHUB_TOKEN']
  end
end