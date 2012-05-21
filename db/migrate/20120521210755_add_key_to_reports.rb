class AddKeyToReports < ActiveRecord::Migration
  def change
    add_column :reports, :key, :string
  end
end
