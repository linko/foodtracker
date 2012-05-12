class ActivitiesController < ApplicationController
  before_filter :authenticate_user!
  before_filter :load_resource, only: [:edit, :update, :destroy]

  inherit_resources
  respond_to :html, :json

  def create
    params[:activity][:user_id] = current_user.id

    @activity = Activity.new params[:activity]

    if @activity.save
      respond_to do |format|
        format.html { redirect_to collection_path }
        format.json { render json: @activity , status: :created }
      end
    else
      respond_to do |format|
        format.html { render :edit }
        format.json { render json: @activity.errors, status: :unprocessable_entity  }
      end
    end

  end

  def update
    @activity.update_attributes params[:activity]

    if @activity.save
      respond_to do |format|
        format.html { redirect_to collection_path }
        format.json { render json: @activity , status: :created }
      end
    else
      respond_to do |format|
        format.html { render :edit }
        format.json { render json: @activity.errors, status: :unprocessable_entity  }
      end
    end
  end

protected

  def collection
    @collection = Activity.latest(current_user)
  end

  def load_resource
    @activity = current_user.activities.find(params[:id])
  end

end
