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

  def edit
    @plan_item = PlanItem.find(params[:id])
  end

  def create
    PlanItem.create!(
      params.permit(:name, :description, :starts_at, :ends_at)
    )

    redirect_to :plan_items
  end

  def update
    plan_item = PlanItem.find(params[:id])
    plan_item.update!(
      params.permit(:name, :description, :starts_at, :ends_at)
    )

    redirect_to :plan_items
  end
end
