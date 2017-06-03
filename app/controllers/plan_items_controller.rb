class PlanItemsController < ApplicationController
  def index
    @plan_items = PlanItem.natural_order
  end

  # GET (collection)
  def of_today
    t0 = Time.current.beginning_of_day
    t1 = Time.current.tomorrow.beginning_of_day
    @plan_items = PlanItem
      .where('starts_at >= ? AND starts_at < ?', t0, t1)
      .or(PlanItem.where('ends_at > ? AND ends_at <= ?', t0, t1))
      .natural_order
    @continued_plan_items = PlanItem
      .where('starts_at < ? AND ends_at > ?', t0, t1)
      .natural_order
    render action: :index
  end

  def show
    @plan_item = PlanItem.find(params[:id])
  end

  def new
    @plan_item = PlanItem.new
    time0 = Time.current.beginning_of_hour
    @plan_item.starts_at = time0.advance(hours: 1)
    @plan_item.ends_at = time0.advance(hours: 2)
    @plan_item.starts_on = Date.today
    @plan_item.ends_on = Date.today
  end

  def edit
    @plan_item = PlanItem.find(params[:id])
    unless @plan_item.all_day?
      @plan_item.starts_on = @plan_item.starts_at.to_date
      if @plan_item.ends_at.seconds_since_midnight == 0
        @plan_item.ends_on = @plan_item.ends_at.yesterday.to_date
      else
        @plan_item.ends_on = @plan_item.ends_at.to_date
      end
    end
  end

  def create
    @plan_item = PlanItem.new(plan_item_params)
    if @plan_item.save
      redirect_to :plan_items, notice: '予定を追加しました。'
    else
      render action: 'new'
    end
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
    params[:plan_item].permit(
      :name, :description, :all_day,
      :starts_at_date_part, :starts_at_time_part,
      :ends_at_date_part, :ends_at_time_part,
      :starts_on, :ends_on
    )
  end
end
