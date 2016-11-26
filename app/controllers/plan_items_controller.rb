class PlanItemsController < ApplicationController
  def index
    @plan_items = PlanItem.order(:starts_at)
  end

  def show
    @plan_item = PlanItem.find(params[:id])
  end

  def new
    @plan_item = PlanItem.new
    time0 = Time.current.beginning_of_hour
    @plan_item.starts_at = time0.advance(hours: 1)
    @plan_item.ends_at = time0.advance(hours: 2)
  end
end
