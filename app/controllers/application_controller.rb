class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

  def user_not_authorized
    # TODO make this more descriptive of why rejected
    flash[:alert] = 'You are not authorized to perform this action.'
    redirect_to(request.referrer || root_path)
  end

  protected

  def configure_permitted_parameters
    # REVIEW: what is this for?
    devise_parameter_sanitizer.for(:sign_up) << :name
  end

  def set_log(item)
    @log = item.url;
  end
end
