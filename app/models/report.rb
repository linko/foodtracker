class Report < ActiveRecord::Base

  validates :period_start, :period_end, :user_id, :email, :subject, presence: true
  attr_accessible :period_start, :period_end, :email, :subject, :comments

  before_create :generate_key
  after_create :send_email

  belongs_to :user

  def to_param
    key
  end

  PERIODS = {
    'All days'      => 'all_days',
    'Last 30 days'  => '30_days',
    'Last 7 days'   => '7_days',
    'Last 24 hours' => '24_hours'
  }

  def self.date_range(period)
    case period
      when '30_days'
        [ 30.days.ago, Date.today ]
      when '7_days'
        [ 7.days.ago, Date.today ]
      when '24_hours'
        [ Date.yesterday, Date.today ]
      else
        [ 10.years.ago.to_date, Date.today.to_date ]
    end
  end

protected

  def generate_key
    self.key = UUID.new.generate[0,18].gsub('-','')
  end

  def send_email
    Mailer.share_report(self).deliver
  end

end
