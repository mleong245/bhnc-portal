class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  def current_ability
    @current_ability ||= Ability.new(current_user)
  end

  protect_from_forgery with: :exception

  before_filter :authenticate_user!
  def after_sign_in_path_for(resource_or_scope)
  current_ability()
    if current_user.admin
        rails_admin_path
    else
        root_path
    end
  end

  def after_sign_out_path_for(resource_or_scope)
    user_session_path #root_path
  end

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to main_app.root_path, :alert => exception.message
  end

end

