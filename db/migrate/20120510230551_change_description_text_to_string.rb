class ChangeDescriptionTextToString < ActiveRecord::Migration
  def change
    change_column :activities, :description, :string
  end

end
