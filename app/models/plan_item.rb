# == Schema Information
#
# Table name: plan_items
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  points     :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class PlanItem < ApplicationRecord
end
