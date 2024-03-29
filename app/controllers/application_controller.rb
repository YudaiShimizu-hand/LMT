class ApplicationController < ActionController::Base
    before_action :configure_sign_up_parameters, if: :devise_controller?

      def after_sign_in_path_for(resource)
        root_path
      end
    
      def after_sign_out_path_for(resource)
        new_user_session_path
      end

  protected
    def configure_sign_up_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys:[:username])
    end
end
