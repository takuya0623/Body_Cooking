class ChangeColumnToNull2 < ActiveRecord::Migration[5.2]
  def up
    change_column_null :users,:is_deleted,true
    change_column :users, :is_deleted, :boolean, default: false
  end

  def down
    change_column_null :users,:is_deleted,false
    change_column :users, :is_deleted, :boolean

  end

end
