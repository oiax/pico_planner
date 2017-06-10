module PlanItemsHelper
  ACTION_LABEL_MAP = {
    index: '予定表',
    of_today: '今日の予定表'
  }

  def plan_items_nav_link(action)
    label = ACTION_LABEL_MAP[action]
    url = (action == :index ? :plan_items : [ action, :plan_items ])
    html_classes = %w(nav-link)
    html_classes << 'active' if action.to_s == params[:action]
    link_to label, url, class: html_classes.join(' ')
  end

  def document_title
    prefix =
      case action_name
      when 'index'; '予定表'
      when 'of_today'; '今日の予定表'
      when 'show'; '予定の詳細'
      when 'new', 'create'; '予定の追加'
      when 'edit', 'update'; '予定の変更'
      else; raise
      end

    "#{prefix} | PicoPlanner"
  end
end
