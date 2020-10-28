class CreateCalories < ActiveRecord::Migration[5.2]
  def change
    create_table :calories do |t|
      t.string :name,null: false
      t.string :calorie,null: false
      t.string :weight,null: false
      t.timestamps
    end
  end
end
