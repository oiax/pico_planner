module ApplicationHelper
  def format_duration(item)
    w1 = format_wday(item.starts_at)
    w2 = format_wday(item.ends_at)

    s = ''
    if item.starts_at.year == Time.current.year
      s << item.starts_at.strftime("%-m月%-d日 (#{w1}) %H:%M")
    else
      s << item.starts_at.strftime("%Y年%-m月%-d日 (#{w1}) %H:%M")
    end

    s << ' ～ '

    if item.ends_at.to_date == item.starts_at.to_date
      s << item.ends_at.strftime('%H:%M')
    elsif item.ends_at.year == item.starts_at.year
      s << item.ends_at.strftime("%-m月%-d日 (#{w2}) %H:%M")
    else
      s << item.ends_at.strftime("%Y年%-m月%-d日 (#{w2}) %H:%M")
    end

    s.html_safe
  end

  def format_datetime(t)
    w = format_wday(t)
    t.strftime("%Y年%-m月%-d日 (#{w}) %H:%M")
  end

  private def format_wday(item)
    %w(日 月 火 水 木 金 土)[item.wday]
  end
end
