class PlanItemsController < ApplicationController
  def index
    @plan_items = PlanItem.all
  end

  def new
    @plan_item = PlanItem.new
  end

  def create
  end
end
