module ApplicationHelper
  def format_duration(item)
    s = ''
    if item.starts_at.year == Time.current.year
      s << item.starts_at.strftime('%m-%d %H:%M')
    else
      s << item.starts_at.strftime('%Y-%m-%d %H:%M')
    end

    s << ' &#x301c; '

    if item.ends_at.to_date == item.starts_at.to_date
      s << item.ends_at.strftime('%H:%M')
    elsif item.ends_at.year == item.starts_at.year
      s << item.ends_at.strftime('%m-%d %H:%M')
    else
      s << item.ends_at.strftime('%Y-%m-%d %H:%M')
    end

    s.html_safe
  end
end
