time0 = Time.current.midnight

item = PlanItem.new
item.name = '読書'
item.description = '『走れメロス』を読む'
item.starts_at = time0.advance(days: 1, hours: 10)
item.ends_at = time0.advance(days: 1, hours: 11)
item.save!

item = PlanItem.new
item.name = '買い物'
item.description = '洗剤を買う'
item.starts_at = time0.advance(days: 1, hours: 16)
item.ends_at = time0.advance(days: 1, hours: 16, minutes: 30)
item.save!

item = PlanItem.new
item.name = '病院'
item.description = '花粉症治療'
item.starts_at = time0.advance(days: 2, hours: 13)
item.ends_at = time0.advance(days: 2, hours: 14)
item.save!

puts PlanItem.count
