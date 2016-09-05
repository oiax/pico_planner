module ApplicationHelper
  def format_duration(item)
    s = item.starts_at.strftime('%Y-%m-%d %H:%M')
    s << ' &#x301c; '
    s << item.ends_at.strftime('%Y-%m-%d %H:%M')
    s.html_safe
  end
end
