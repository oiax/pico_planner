module PlanItemsHelper
  ACTION_LABEL_MAP = {
    index: '予定表',
    of_today: '今日の予定表'
  }

  def plan_items_nav_link(action)
    label = ACTION_LABEL_MAP[action]
    url = (action == :index ? :plan_items : [ action, :plan_items ])
    css_classes = %w(nav-link)
    css_classes << 'active' if action.to_s == params[:action]
    link_to label, url, class: css_classes.join(' ')
  end

  def document_title
    prefix =
      case params[:action]
      when 'index'; '予定表'
      when 'of_today'; '今日の予定表'
      when 'show'; '予定の詳細'
      when 'new', 'create'; '予定の追加'
      when 'edit', 'update'; '予定の変更'
      else; ''
      end

    if prefix.present?
      "#{prefix} | PicoPlanner"
    else
      'PicoPlanner'
    end
  end
end
