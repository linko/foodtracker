class Activity < ActiveRecord::Base
  attr_accessible :category_id, :description, :user_id

  belongs_to :category
  belongs_to :user

  def latest

  end

  def self.latest period_start = 2.weeks.ago.to_date, period_end = Date.today.to_date
    activities = Activity.select("to_char(updated_at, 'YYYY-MM-DD') as date, category_id, description").where("updated_at BETWEEN ? and NOW() ",period_start ).group("to_char(updated_at, 'YYYY-MM-DD'), category_id, description")
    activities_by_date = activities.inject(Hash.new{|h,k| h[k] = [] }) {|map, object| map[object.date] << [object.category_id, object.description]; map }

    activities_by_category = {}

    activities_by_date.each do |date, hash|
      activities_by_category[date] ||= {}
        hash.each do |k,v|
        activities_by_category[date][k] ||= []
        activities_by_category[date][k] << v
      end
    end


    #for day in period_start..period_end
    #  day = day.to_s("%Y-%m-%d")
    #  activities_by_category[day] = {} if activities_by_category[day].nil?
    #end
    activities_by_category.sort.reverse
  end
end
