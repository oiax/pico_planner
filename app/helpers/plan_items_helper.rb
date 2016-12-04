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
end