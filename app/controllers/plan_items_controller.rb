class PlanItemsController < ApplicationController
  def index
    @plan_items = PlanItem.all
  end

  def new
    @plan_item = PlanItem.new
    @plan_item.starts_at = Time.current.beginning_of_hour.advance(hours: 1)
    @plan_item.ends_at = Time.current.beginning_of_hour.advance(hours: 2)
  end

  def create
  end
end
