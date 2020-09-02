class SessionsController < ApplicationController
    skip_before_action :authorized, only: [:new, :create]
    
    def new 
      render :new
    end
    
    def create

      @user = User.find_by(username: params[:username])
      if @user && @user.authenticate(params[:password]) 
        session[:user_id] = @user.id
        flash[:notice] = "Welcome, #{@user.username}. You are logged in."
        redirect_to user_path(@user)
      else
        flash[:errors] = 'Invalid username or password.'
        redirect_to new_session_path 
      end
    end
    
    def destroy
        # logs a user out
      session.delete(:user_id)
      flash[:notice] = 'Logout Successful'
      redirect_to new_session_path
    end

end