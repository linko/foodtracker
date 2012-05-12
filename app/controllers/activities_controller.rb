class ActivitiesController < ApplicationController
  before_filter :authenticate_user!
  before_filter :load_resource, only: [:edit, :update, :destroy]

  inherit_resources
  respond_to :html, :json

  def create
    params[:activity][:user_id] = current_user.id
    create! do |format|
      format.html { redirect_to collection_path }
      format.json { respond_with resource }
    end
  end

  def update
    update! do |format|
      format.html { redirect_to collection_path }
      format.json { respond_with resource }
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
