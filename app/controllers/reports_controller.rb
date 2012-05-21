class ReportsController < ApplicationController
  before_filter :authenticate_user!, except: [ :show ]
  before_filter :load_categories, only: [ :index, :show ]

  def index
    period_start, period_end = Report.date_range(params[:period])
    @activities = Activity.for_report(current_user, period_start, period_end)
  end

  def new
    period_start, period_end = Report.date_range(params[:period])
    @report = Report.new
    @report.period_start = period_start
    @report.period_end   = period_end
  end

  def show
    @report = Report.find_by_key(params[:id])
    @activities = Activity.for_report(@report.user, @report.period_start, @report.period_end)
    render :index
  end

  def create
    @report = Report.new(params[:report])
    @report.user = current_user

    if @report.save
      redirect_to root_path, notice: "Report was successfully sent to #{@report.email}"
    else
      render :new
    end
  end

protected

  def load_categories
    @categories = Category.all
  end
end
