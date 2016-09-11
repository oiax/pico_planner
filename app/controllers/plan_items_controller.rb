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
    @plan_item = PlanItem.new
    @plan_item.name = params[:plan_item][:name]
    @plan_item.description = params[:plan_item][:description]
    @plan_item.starts_at = params[:plan_item][:starts_at]
    @plan_item.ends_at = params[:plan_item][:ends_at]
    @plan_item.save

    redirect_to :root
  end
end
