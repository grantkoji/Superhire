class AppointmentsController < ApplicationController
  def new
    @appointment = Appointment.new 
  end

  def create 
    @appointment = Appointment.create(appointment_params)
      if @appointment.valid?
        redirect_to appointment_path(@appointment)
      else
        if @appointment.hrs_id
          flash[:errors] = @appointment.errors.full_messages
          redirect_to user_path(@appointment.hrs_id)
        else
          flash[:errors] = @appointment.errors.full_messages
          redirect_to superhero_path(@appointment.superhero_id)
        end
      end
  end

  def show
    @appointment = Appointment.find(params[:id])
  end

  def appointment_params
    params.require(:appointment).permit!
  end


end
