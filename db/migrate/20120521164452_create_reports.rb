class CreateReports < ActiveRecord::Migration
  def change
    create_table :reports do |t|
      t.date    :period_start
      t.date    :period_end
      t.integer :user_id
      t.string  :email
      t.string  :subject
      t.text    :comments
      t.timestamps
    end
  end
end
