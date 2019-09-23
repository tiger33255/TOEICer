class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?
    protected

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :nickname, :toeic_score, :user_image])
        devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :nickname, :toeic_score, :user_image])
    end

    def after_sign_out_path_for(resource)
        articles_path
    end

    def after_update_path_for(resource)
        users_path
      end
end