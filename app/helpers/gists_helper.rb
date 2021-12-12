module GistsHelper
  GIT_HUB_PATH = "https://gist.github.com/".freeze

  def create_gist_link(gist_id)
    GIT_HUB_PATH + gist_id
  end
end
