module ApplicationHelper
  def format_duration(item)
    s = item.starts_at.to_s
    s << '&#x301c;'
    s << item.ends_at.to_s
    s.html_safe
  end
end
