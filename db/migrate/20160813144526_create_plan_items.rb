class CreatePlanItems < ActiveRecord::Migration[5.0]
  def change
    create_table :plan_items do |t|
      t.string :name, null: false
      t.text :description, null: false
      t.datetime :starts_at, null: false
      t.datetime :ends_at, null: false
      t.boolean :all_day, null: false, default: false

      t.timestamps
    end
  end
end
