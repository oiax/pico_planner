class PlanItemsController < ApplicationController
  def index
    @plan_items = PlanItem.order(:starts_at, :ends_at)
  end
end
