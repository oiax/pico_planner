item = PlanItems.new
item.name = '読書'
item.description = '『走れメロス』を読む'
item.save!

puts PlanItem.count
