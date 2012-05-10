class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.integer :user_id
      t.integer :category_id
      t.text :description

      t.timestamps
    end
  end
end
