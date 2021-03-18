class ApplicationController < ActionController::Base

    protected

    def authenticate_admin
        unless current_user.admin?
            redirect_to root_path
        end
    end

    def save_return_path
        session[:return_path] = request.fullpath
    end

    def return_path
        session[:return_path]
    end
end
