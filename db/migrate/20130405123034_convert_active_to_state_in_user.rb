class ConvertActiveToStateInUser < ActiveRecord::Migration
  def up
    User.transaction do
      User.where(active: true).update_all(state: "active")
      User.where(active: false).update_all(state: "deleted")
    end
  end

  def down
    User.transaction do
      User.where(state: "deleted").update_all(acitve: false)
    end
  end
end
