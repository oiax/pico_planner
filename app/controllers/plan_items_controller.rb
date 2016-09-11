class PlanItemsController < ApplicationController
  def index
    @plan_items = PlanItem.all
  end

  def new
  end

  def create
  end
end
