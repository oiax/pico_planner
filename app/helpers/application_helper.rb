# -*- frozen_string_literal: true -*-

module ApplicationHelper
  def format_duration(item)
    s = String.new('')
    if item.starts_at.year == Time.current.year
      s << item.starts_at.strftime('%-m月%-d日 %H:%M')
    else
      s << item.starts_at.strftime('%Y年%-m月%-d日 %H:%M')
    end

    s << ' 〜 '

    if item.ends_at.to_date == item.starts_at.to_date
      s << item.ends_at.strftime('%H:%M')
    elsif item.ends_at.year == item.starts_at.year
      s << item.ends_at.strftime('%-m月%-d日 %H:%M')
    else
      s << item.ends_at.strftime('%Y年%-m月%-d日 %H:%M')
    end
  end
end
