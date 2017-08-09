class DoctorsController < ApplicationController
  #before_action :set_receptionist, only: [:show, :edit, :update, :destroy]

  def index
    @doctor = Doctor.all
  end

  def show
    @doctor = Doctor.find(params[:id])
  end

  def new
    @doctor = Doctor.new
  end

  def edit
  end

  def create
    @doctor = Doctor.new(doctor_params)
    if @doctor.save
      log_in @doctor
      flash[:success] = "Welcome Doctor!"
      redirect_to @doctor
  end

  def update
    end
  end

  def destroy
  end

  private
    def set_doctor
      @doctor = Doctor.find(params[:id])
    end

    def doctor_params
      params.require(:doctor).permit(:name, :email, :password,
                                    :password_confirmation)
    end
end
