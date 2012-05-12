class ActivitiesController < ApplicationController
  inherit_resources

  before_filter :authenticate_user!

  respond_to :html, :json

  def create
    params[:activity][:user_id] = current_user.id
    create!{ collection_path }
  end

  def collection
    @collection = Activity.latest(current_user)
  end


end
