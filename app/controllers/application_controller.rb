class ApplicationController < ActionController::Base
    before_action :authenticate_user!, except: [:show, :index, :search]

    before_action :configure_permitted_parameters, if: :devise_controller?


    def after_sign_in_path_for(resource)
        rooms_path
    end

    def after_sign_out_path_for(resource)
        rooms_path
    end

    protected

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :icon_image])
        devise_parameter_sanitizer.permit(:account_update, keys: [:name, :icon_image , :self_introduce])
    end
end
