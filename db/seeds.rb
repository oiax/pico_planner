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
item.name = '帰省'
item.description = "新幹線の指定席を取る。\nお土産を買う。"
item.starts_at = time0.beginning_of_year.advance(years: 1, days: -2)
item.ends_at = time0.beginning_of_year.advance(years: 1, days: 3)
item.save!

puts PlanItem.count
