class AddStateToUser < ActiveRecord::Migration
  def change
    add_column :users, :state, :string, null: false, default: ""
  end
end
