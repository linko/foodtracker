class ActivitiesController < ApplicationController
  inherit_resources

  def create
    create!{ collection_path }
  end


end
