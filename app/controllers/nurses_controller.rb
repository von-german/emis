class NursesController < ApplicationController
  #before_action :set_receptionist, only: [:show, :edit, :update, :destroy]

  # GET /receptionists
  # GET /receptionists.json
  def index
    @nurse = Nurse.all
  end

  # GET /receptionists/1
  # GET /receptionists/1.json
  def show
    @nurse = Nurse.find(params[:id])
  end

  # GET /receptionists/new
  def new
    @nurse = Nurse.new
  end

  # GET /receptionists/1/edit
  def edit
  end

  # POST /receptionists
  # POST /receptionists.json
  def create
    @nurse = Nurse.new(nurse_params)
    if @nurse.save
      log_in @nurse
      flash[:success] = "Welcome Nurse!"
      redirect_to @nurse
    else
      render 'edit'
  end

  # PATCH/PUT /receptionists/1
  # PATCH/PUT /receptionists/1.json
  def update
    end
  end

  # DELETE /receptionists/1
  # DELETE /receptionists/1.json
  def destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_nurse
      @nurse = Nurse.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def nurse_params
      params.require(:nurse).permit(:name, :email, :password,
                                    :password_confirmation)
    end
end
