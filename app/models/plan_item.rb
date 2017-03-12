# == Schema Information
#
# Table name: plan_items
#
#  id          :integer          not null, primary key
#  name        :string           not null
#  description :text             not null
#  starts_at   :datetime         not null
#  ends_at     :datetime         not null
#  all_day     :boolean          default(FALSE), not null
#  starts_on   :date
#  ends_on     :date
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class PlanItem < ApplicationRecord
  before_save do
    if starts_at_date_part && starts_at_time_part
      self.starts_at = "#{starts_at_date_part} #{starts_at_time_part}"
    end

    if ends_at_date_part && ends_at_time_part
      self.ends_at = "#{ends_at_date_part} #{ends_at_time_part}"
    end

    if all_day?
      self.starts_at = starts_on.to_datetime if starts_on
      self.ends_at = ends_on.tomorrow.to_datetime if ends_on
    end
  end

  attr_writer :starts_at_date_part, :starts_at_time_part,
    :ends_at_date_part, :ends_at_time_part

  def starts_at_date_part
    @starts_at_date_part ||= starts_at&.strftime('%Y-%m-%d')
  end

  def starts_at_time_part
    @starts_at_time_part ||= starts_at&.strftime('%H:%M')
  end

  def ends_at_date_part
    @ends_at_date_part ||= ends_at&.strftime('%Y-%m-%d')
  end

  def ends_at_time_part
    @ends_at_time_part ||= ends_at&.strftime('%H:%M')
  end
end
