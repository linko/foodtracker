class Category < ActiveRecord::Base
  attr_accessible :name

  has_many :activities, dependent: :destroy

  validates :name, presence: true

  def is_weight?
    name.eql?('Weight')
  end

end
