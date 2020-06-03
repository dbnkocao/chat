class ApplicationController < ActionController::Base
  include CanCan::ControllerAdditions
  before_action :authenticate_user!

  rescue_from CanCan::AccessDenied do |exception|
    respond_to do |format|
      format.json { head :forbidden, content_type: "text/html" }
      format.html { redirect_to "/", notice: exception.message }
    end
  end
end
