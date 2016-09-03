item = PlanItem.new
item.name = '読書'
item.description = '『走れメロス』を読む'
item.save!

item = PlanItem.new
item.name = '買い物'
item.description = '洗剤を買う'
item.save!

item = PlanItem.new
item.name = '病院'
item.description = '花粉症治療'
item.save!

puts PlanItem.count
