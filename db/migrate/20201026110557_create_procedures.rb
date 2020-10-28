class CreateProcedures < ActiveRecord::Migration[5.2]
  def change
    create_table :procedures do |t|
      t.integer :post_id, null: false
      t.string :image_id, null: false
      t.text :description, null: false
      t.timestamps
    end
  end
end
