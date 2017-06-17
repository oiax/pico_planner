# == Schema Information
#
# Table name: plan_items
#
#  id          :integer          not null, primary key
#  name        :string           not null
#  description :text             not null
#  all_day     :boolean          default(FALSE), not null
#  starts_at   :datetime         not null
#  ends_at     :datetime         not null
#  starts_on   :date
#  ends_on     :date
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class PlanItem < ApplicationRecord
  scope :natural_order,
    -> { order(starts_at: :asc, all_day: :desc, id: :asc) }

  before_validation do
    if starts_at_date_part && starts_at_time_part
      if starts_at_date_part.present? && starts_at_time_part.present?
        self.starts_at = "#{starts_at_date_part} #{starts_at_time_part}"
      else
        self.starts_at = nil
      end
    end

    if ends_at_date_part && ends_at_time_part
      if ends_at_date_part.present? && ends_at_time_part.present?
        self.ends_at = "#{ends_at_date_part} #{ends_at_time_part}"
      else
        self.ends_at = nil
      end
    end
  end

  validates :name, presence: true, length: { maximum: 80 }
  validates :description, length: { maximum: 400 }
  validates :starts_on, :ends_on, presence: { if: :all_day? }
  validates :starts_at, :ends_at, presence: { unless: :all_day? }

  validate do
    if starts_on && ends_on && starts_on > ends_on
      errors.add(:ends_on, :too_early)
    end

    if starts_at && ends_at && starts_at > ends_at
      errors.add(:ends_at, :too_early)
    end
  end

  before_save do
    if all_day?
      self.starts_at = starts_on.beginning_of_day if starts_on
      self.ends_at = ends_on.tomorrow.beginning_of_day if ends_on
    else
      self.starts_on = nil
      self.ends_on = nil
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
