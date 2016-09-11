class PlanItemsController < ApplicationController
  def index
    @plan_items = PlanItem.all
  end

  def new
    @plan_item = PlanItem.new
    time0 = Time.current.beginning_of_hour
    @plan_item.starts_at = time0.advance(hours: 1)
    @plan_item.ends_at = time0.advance(hours: 2)
  end

  def create
    PlanItem.create(plan_item_params)

    redirect_to :root
  end

  private def plan_item_params
    params[:plan_item].permit(:name, :description, :starts_at, :ends_at)
  end
end
