class PlanItemsController < ApplicationController
  def index
    @plan_items = PlanItem.order(:starts_at)
  end

  def show
    @plan_item = PlanItem.find(params[:id])
  end
end
