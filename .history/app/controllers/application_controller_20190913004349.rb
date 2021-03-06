class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?
    protected

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :nickname, :toeic_score, :image])
        devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :nickname, :toeic_score, :image])
    end

    def after_sign_up_path_for(resource)
        article_index_path
    end

    def after_sign_in_path_for(resource)
        article_index_path
    end


end