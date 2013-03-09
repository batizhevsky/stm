class CreateStories < ActiveRecord::Migration
  def change
    create_table :stories do |t|
      t.text :body
      t.integer :user_id
      t.string :state

      t.timestamps
    end
  end
end
