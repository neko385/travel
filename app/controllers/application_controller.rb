class ApplicationController < ActionController::Base
  # before_action :authenticate_customer!, except: [:top, :about]
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    if admin_signed_in?
      admin_customers_path
    elsif customer_signed_in?
      travel_memories_path
    else
      root_path
    end
  end

  def after_sign_out_path_for(resource)
    case resource
      when :admin
        new_admin_session_path
      when :customer
        root_path
    end
  end

  # def after_sign_up_path_for(resource)
  #   customer_path(resource)
  # end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:screen_name, :last_name, :first_name, :last_kana, :first_kana])
  end
end
