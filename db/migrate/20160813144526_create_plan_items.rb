class CreatePlanItems < ActiveRecord::Migration[5.0]
  def change
    create_table :plan_items do |t|
      t.string :name, null: false
      t.integer :points

      t.timestamps
    end
  end
end
