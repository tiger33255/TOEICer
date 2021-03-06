class ApplicationController < ActionController::Base
    before_action :set_search
    before_action :configure_permitted_parameters, if: :devise_controller?
    protected

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :nickname, :toeic_score, :reading_score, :listening_score, :user_image, :word])
        devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :nickname, :toeic_score, :reading_score, :listening_score, :user_image, :word])
    end

    def after_sign_out_path_for(resource)
        root_path
    end

    def set_search
        q = params[:q]
        @articles = Article.ransack(body_cont: q).result(distinct: true)
        @articles = Article.ransack(title_cont: q).result(distinct: true)
        @articles = Article.ransack(part_list_cont: q).result(distinct: true)
        @articles = Article.ransack(key_word_cont: q).result(distinct: true)
    end

end