class ActivitiesController < ApplicationController
  inherit_resources

  def create
    create!{ collection_path }
  end

  def collection
    @collection = Activity.latest
  end


end
