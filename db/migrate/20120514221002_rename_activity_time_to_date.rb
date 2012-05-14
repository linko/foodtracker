class RenameActivityTimeToDate < ActiveRecord::Migration
  def change
    rename_column :activities, :activity_time, :date
    change_column :activities, :date, :date
  end
end
