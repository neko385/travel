class ApplicationController < ActionController::Base
  before_action :authenticate_customer!, except: [:top, :about]
  before_action :configure_permitted_parameters, if: :devise_controller?

  # 顧客側ログイン後
  def after_public_sign_in_path_for(resource)
    public_travel_memories_path
  end
  # 顧客側新規登録後
  def after_public_sign_up_path_for(resource)
    public_customer_path
  end
  # 顧客側ログアウト後
  def after_public_sign_out_path_for(resource)
    public_root_path
  end
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:screen_name, :last_name, :first_name, :last_kana, :first_kana])
  end
end
