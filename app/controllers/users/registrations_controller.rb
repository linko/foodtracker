class Users::RegistrationsController < Devise::RegistrationsController
  respond_to :json, :html
  skip_before_filter :verify_authenticity_token, :only => :create

  def create
    respond_to do |format|
      format.html {
        super
      }
      format.json {
        build_resource
        if resource.save
          render :status => 200, :json => resource
        else
          render :json => resource.errors, :status => :unprocessable_entity
        end
      }
    end
  end
end