# == Schema Information
#
# Table name: plan_items
#
#  id          :integer          not null, primary key
#  name        :string           not null
#  description :text             not null
#  starts_at   :datetime         not null
#  ends_at     :datetime         not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class PlanItem < ApplicationRecord
end
