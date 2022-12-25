module ApplicationHelper
  def page_title(page_title = '')
    base_title = "がらぽんごはん"

    page_title.empty? ? base_title : page_title + ' | ' + base_title
  end
end
