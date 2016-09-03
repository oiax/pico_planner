class PlanItemsController < ApplicationController
  def index
    @plan_items = PlanItem.all
  end
end
