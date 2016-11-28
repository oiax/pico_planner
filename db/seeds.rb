time0 = Time.current.beginning_of_day

PlanItem.create!(
  name: '読書',
  description: '『走れメロス』を読む',
  starts_at: time0.advance(days: 1, hours: 10),
  ends_at: time0.advance(days: 1, hours: 11)
)

PlanItem.create!(
  name: '買い物',
  description: '洗剤を買う',
  starts_at: time0.advance(hours: 16),
  ends_at: time0.advance(hours: 16, minutes: 30)
)

PlanItem.create!(
  name: '帰省',
  description: "新幹線の指定席を取る。\nお土産を買う。",
  starts_at: time0.beginning_of_year.advance(years: 1, days: -2),
  ends_at: time0.beginning_of_year.advance(years: 1, days: 3)
)
