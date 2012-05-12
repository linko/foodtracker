class ActivitiesController < ApplicationController
  inherit_resources

  before_filter :authenticate_user!

  respond_to :html, :json

  def create
    create!{ collection_path }
  end

  def collection
    @collection = Activity.latest
  end


end
