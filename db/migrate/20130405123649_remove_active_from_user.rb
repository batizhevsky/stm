class RemoveActiveFromUser < ActiveRecord::Migration
  def up
    remove_column :users, :active
  end

  def down
    add_column :users, :active, default: true, nil: false
  end
end
