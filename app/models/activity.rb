class Activity < ActiveRecord::Base
  attr_accessible :category_id, :description, :user_id, :category, :activity_time

  belongs_to :category
  belongs_to :user

  validates :user_id, :category_id, :description, :activity_time, presence: true
  validate :validate_weight

  def self.latest(user, period_start = 10.years.ago.to_date, period_end = Date.today.to_date)
    activities = Activity.select("id, to_char(activity_time, 'YYYY-MM-DD') as date, category_id, description").where("user_id = ? and activity_time BETWEEN ? and NOW() ",user.id, period_start ).group("to_char(activity_time, 'YYYY-MM-DD'), id, category_id, description")

    # group by date
    activities_by_date = activities.inject(Hash.new{|h,k| h[k] = [] }) {|h, object| h[object.date] << [object.category_id, [object.id, object.description]]; h }

    # group by category in date subarray
    activities_by_category = {}
    activities_by_date.each do |date, hash|
      activities_by_category[date] ||= {}
      hash.each do |k,v|
        activities_by_category[date][k] ||= []
        activities_by_category[date][k] << v
      end

      # sort by category id
      activities_by_category[date] = activities_by_category[date].sort
    end

    # add dates with empty activities
    #for day in period_start..period_end
    #  day = day.to_s("%Y-%m-%d")
    #  activities_by_category[day] = {} if activities_by_category[day].nil?
    #end

    # sort by date
    activities_by_category.sort.reverse
  end

  def validate_weight

    if category.present? && category.is_weight? && description.to_f.zero?
      errors.add(:description, 'should be numerical')
    end
  end
end
