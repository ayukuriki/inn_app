class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller? 
    helper_method :current_user

    private

    def after_sign_in_path_for(resource)
      root_path
    end

    def after_sign_out_path_for(resource_or_scope)
        root_path
    end 

    protected

  def configure_permitted_parameters
    added_attrs = [:name, :email, :password, :password_confirmation, :image, :self_introduction]
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:name])
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :sign_in, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end


end
