class PlanItemsController < ApplicationController
  def index
    @plan_items = PlanItem.order(:starts_at)
  end

  # GET (collection)
  def of_today
    t0 = Time.current.beginning_of_day
    t1 = Time.current.tomorrow.beginning_of_day
    @plan_items = PlanItem
      .where('starts_at >= ? AND starts_at < ?', t0, t1)
      .or(PlanItem.where('ends_at > ? AND ends_at <= ?', t0, t1))
      .order(:starts_at)
    @continued_plan_items = PlanItem
      .where('starts_at < ? AND ends_at > ?', t0, t1)
      .order(:starts_at)
    render action: 'index'
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
    PlanItem.create(plan_item_params)

    redirect_to :plan_items, notice: '予定を追加しました。'
  end

  def update
    plan_item = PlanItem.find(params[:id])
    plan_item.update_attributes(plan_item_params)

    redirect_to :plan_items, notice: '予定を更新しました。'
  end

  def destroy
    plan_item = PlanItem.find(params[:id])
    plan_item.destroy!

    redirect_to :plan_items, notice: '予定を削除しました。'
  end

  private def plan_item_params
    params[:plan_item].permit(:name, :description, :starts_at, :ends_at)
  end
end
