module ApplicationHelper

  def now_year
    Date.today.year
  end

  def github_link(author, repo)
    "https://github.com/#{author}/#{repo}"
  end
end
