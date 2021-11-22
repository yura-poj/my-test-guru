module ApplicationHelper
  def now_year
    Date.today.year
  end

  def github_link(author, repo)
    "https://github.com/#{author}/#{repo}"
  end

  # def flash_message
  #   if flash.present?
  #     raw(flash.map do |type, message|
  #       content_tag :p, message, class: "flash #{type}"
  #     end.join(''))
  #   end
  # end
end
