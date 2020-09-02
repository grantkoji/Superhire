class ApplicationController < ActionController::Base
  before_action :current_user 
  before_action :authorized
   
    
    def current_user
      @current_user = User.find_by(id: session[:user_id])
    end
    
    def authorized
        if @current_user 
        else
        flash[:notice] = "You must log into your account to see this page"
        redirect_to new_session_path
      end
    end

end