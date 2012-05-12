class RenameColumnDateToActivityTime < ActiveRecord::Migration
  def change
    rename_column :activities, :date, :activity_time
  end

end
