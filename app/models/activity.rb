class Activity < ActiveRecord::Base
  attr_accessible :category_id, :description, :user_id

  belongs_to :category
  belongs_to :user
end
