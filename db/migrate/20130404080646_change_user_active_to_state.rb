class ChangeUserActiveToState < ActiveRecord::Migration
  def up
    add_column :users, :state, :string, default: "", null: false
    User.all.each do |u|
      if u.active
        u.update_attribute(:state, "active")
      else
        u.update_attribute(:state, "deleted")
      end
    end
    remove_column :users, :active
  end

  def down
    add_column :users, :active, :boolean, default: true, null: false
    User.all.each do |u|
      u.update_attribute(:active, false) if u.state != "active"
    end
    remove_column :users, :state
  end
end
