class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.integer :user_id, null: false
      t.string :name, null: false
      t.text :description, null: false
      t.integer :calorie, null: false
      t.string :image_id, null: false
      t.boolean :is_light, null: false, default: false
      t.timestamps
    end
  end
end


