class AppointmentsController < ApplicationController
  before_action :set_appointment, only: [:show, :edit, :update, :destroy]
  before_action :set_appointments, only: [:index, :show, :edit]

  def index
    @upcoming_appointments = current_user.upcoming_appointments
  end

  def show
  end

  def new
    @appointments = current_user.appointments.select { |a| a.persisted? }
    @appointment = current_user.appointments.build
  end

  def create
    @appointment = Appointment.new(appointment_params.merge(user_id: current_user.id))
    if @appointment.valid?
      @appointment.save
      redirect_to appointments_path
    else
      @appointment.user = nil
      @appointments = current_user.appointments.select { |a| a.persisted? }
      render :new
    end
  end

  def edit
  end

  def update
    if @appointment.update(appointment_params)
      redirect_to appointments_path
    else
      set_appointments
      render :edit
    end
  end

  def destroy
    @appointment.destroy
    redirect_to appointments_path
  end

  private

  def set_appointment
    @appointment = current_user.appointments.find_by(id: params[:id])
    if @appointment.nil?
      flash[:error] = "Appointment not found."
      redirect_to appointments_path
    end
  end

  def set_appointments
    @appointments = current_user.appointments.order(appointment_time: :desc)
  end

  def appointment_params
    params.require(:appointment).permit(appointment_time: [:date, :hour, :min], duration: [:hour, :min])
  end

end
