# -*- frozen_string_literal: true -*-

module ApplicationHelper
  def format_duration(item)
    if item.all_day?
      format_date_duration(item)
    else
      format_datetime_duration(item)
    end
  end

  private def format_date_duration(item)
    w1 = format_wday(item.starts_on)
    w2 = format_wday(item.ends_on)

    s = String.new('')
    if item.starts_on.year == Time.current.year
      s << item.starts_on.strftime("%-m月%-d日 (#{w1})")
    else
      s << item.starts_on.strftime("%Y年%-m月%-d日 (#{w1})")
    end

    if item.starts_on != item.ends_on
      s << ' ～ '

      if item.ends_on.year == item.starts_on.year
        s << item.ends_on.strftime("%-m月%-d日 (#{w2})")
      else
        s << item.ends_on.strftime("%Y年%-m月%-d日 (#{w2})")
      end
    end

    s
  end

  private def format_datetime_duration(item)
    w1 = format_wday(item.starts_at)
    w2 = format_wday(item.ends_at)

    s = String.new('')
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
  end

  def format_date(date)
    w = format_wday(date)
    date.strftime("%Y年%-m月%-d日 (#{w})")
  end

  def format_datetime(datetime)
    w = format_wday(datetime)
    datetime.strftime("%Y年%-m月%-d日 (#{w}) %H:%M")
  end

  def format_wday(datetime)
    %w(日 月 火 水 木 金 土)[datetime.wday]
  end

  def document_title
    'PicoPlanner'
  end

  def form_group_for(form_builder, field_name, options = {}, &block)
    errors = form_builder.object.errors

    html_classes = %w(form-group)
    html_classes << options[:class] if options[:class]
    html_classes << 'has-danger' if errors.include?(field_name)
    options[:class] = html_classes.join(' ')

    inner_html = capture(&block)
    if errors.include?(field_name)
      errors.full_messages_for(field_name).each do |message|
        inner_html << content_tag(:div, message, class: 'form-control-feedback')
      end
    end

    content_tag :div, inner_html, options
  end
end
