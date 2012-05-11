class Category < ActiveRecord::Base
  attr_accessible :name

  def is_weight?
    name.eql?('Weight')
  end

end
