module ApplicationHelper
  def now_year
    Date.today.year
  end

  def github_link(author, repo)
    "https://github.com/#{author}/#{repo}"
  end

  def flash_message()
    # if flash[:alert]
    #   content_tag :p, flash[:alert], class: 'flash alert'
    # end
    # flash.each {|a,b| puts(a, b, 'dsf')}
    if flash.present?
      raw(flash.map do |type, message|
        content_tag :p, message, class: "flash #{type}"
      end.join(''))
    end

  end
end
