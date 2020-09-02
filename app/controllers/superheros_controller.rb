class SuperherosController < ApplicationController
  # skip_before_action :authorized

  def index
    @superheros = Superhero.all 
  end

  def show
    @superhero = Superhero.find(params[:id]) 
    @appointment = Appointment.new 
    if session[:view_count]
      session[:view_count] = session[:view_count] + 1 
    else 
      session[:view_count] = 1
    end 
  end

  def search
    # byebug
    @found_superheros = Superhero.search_api(params[:search])
    @superheros = Superhero.all 
    @bad_search = 0 
    if @found_superheros == [] 
      @bad_search = 1
      render :index
    else  
      render :index 
    end
  end

  def result 
  end

private 

  def superhero_params
    params.require(:superhero).permit(:search)
  end

end
