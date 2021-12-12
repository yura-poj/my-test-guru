class GitHubClient
  def initialize
    @client = setup_http_client
  end

  def create_gist(params)
    @client.create_gist params
  end

  private

  def setup_http_client
    Octokit::Client.new access_token: ENV['ACCESS_GITHUB_TOKEN']
    #Octokit::Client.new(login: 'yurap6002@gmail.com', password: 'yura_git1')
  end
end