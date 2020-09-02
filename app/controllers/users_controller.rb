class UsersController < ApplicationController
  skip_before_action :authorized, only: [:new, :create, :show]

    def index
      @users = User.search(params[:search])
    end

    def show
      @user = User.find(params[:id])
      @appointment = Appointment.new
      if session[:view_count]
        session[:view_count] = session[:view_count] + 1 
      else 
        session[:view_count] = 1
      end 
    end

    def new
      @user = User.new
    end

    def create
      user = User.create(user_params) 
      if user.valid?
        session[:user_id] = user.id
        if user.is_hero == false
          redirect_to user_path(user)
        else
          redirect_to edit_user_path(user)
        end
      else
        flash[:errors] = user.errors.full_messages
        redirect_to new_user_path
      end
    end

    def edit
      @user = User.find(params[:id]) 
      if @user == @current_user
        render :edit 
      else
        flash[:errors] = "#{@user.name} can only edit this profile page" 
        redirect_to user_path(@user)
      end
    end

    def update
      user = User.find(params[:id])
      user.update(user_params)
      if user.valid?
        session[:user_id] = user.id
        redirect_to user_path(user)
        else
          flash[:errors] = user.errors.full_messages
          redirect_to edit_user_path(user)
        end
    end

    def destroy

        user = User.find(params[:id])
        appt_total = []
        appt_cust = Appointment.where(customer_id: user.id)
        appt_hrs = Appointment.where(hrs_id: user.id)
        appt_total = appt_cust + appt_hrs
        appt_total.each do |appointment| 
          appointment.destroy
        end
        user.destroy
        redirect_to new_session_path
    end
    private
    def user_params
      params.require(:user).permit!
    end

    # def search_params
    #   params.require(:search).permit!
    # end
end
