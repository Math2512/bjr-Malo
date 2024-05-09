class ApplicationController < ActionController::Base

    include Pagy::Backend
    
    layout -> { set_layout }
    #before_action :authenticate_user, unless: :devise_controller?

private
    
    def authenticate_user
        unless current_user
            redirect_to new_user_session_path, alert: "Veuillez vous connecter pour accéder à cette page."
        end
    end
    

protected
    def after_sign_out_path_for(resource_or_scope)
        new_user_session_path
    end

    def after_sign_in_path_for(resource)
        root_path
    end

    def set_layout
        if user_signed_in?
            "application"
        else
            "bare"
        end
    end
end
