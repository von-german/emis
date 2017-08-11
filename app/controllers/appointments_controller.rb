class AppointmentsController < ApplicationController
  before_action :set_appointment, only: [:show, :edit, :update, :destroy]
  before_action :set_appointments, only: [:index, :show, :edit]

  def index
    authorize Appointment
    if current_user.receptionist?
      @upcoming_appointments = Appointment.all
    else
      @upcoming_appointments = current_user.upcoming_appointments
    end
  end

  def show
    authorize Appointment
  end

  def new
    @appointments = current_user.appointments.select { |a| a.persisted? }
    @appointment = current_user.appointments.build
    authorize Appointment
  end

  def create
    authorize Appointment
    @appointment = Appointment.new(appointment_params)
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
    @appointment = Appointment.find(params[:id])
    authorize Appointment
  end

  def update
    authorize Appointment
    if @appointment.update(appointment_params)
      redirect_to appointments_path
    else
      set_appointments
      render :edit
    end
  end

  def destroy
    authorize Appointment
    @appointment.destroy
    redirect_to appointments_path
  end

  private

  def set_appointment
    @appointment = Appointment.find(params[:id])
    if @appointment.nil?
      flash[:error] = "Appointment not found."
      redirect_to appointments_path
    end
  end

  def set_appointments
    @appointments = current_user.appointments.order(appointment_time: :desc)
  end

  def appointment_params
    params.require(:appointment).permit(:user_id, appointment_time: [:date, :hour, :min], duration: [:hour, :min])
  end

end
