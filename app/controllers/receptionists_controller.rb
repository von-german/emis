class ReceptionistsController < ApplicationController
  #before_action :set_receptionist, only: [:show, :edit, :update, :destroy]

  # GET /receptionists
  # GET /receptionists.json
  def index
    @receptionists = Receptionist.all
  end

  # GET /receptionists/1
  # GET /receptionists/1.json
  def show
    @receptionist = Receptionist.find(params[:id])
  end

  # GET /receptionists/new
  def new
    @receptionist = Receptionist.new
  end

  # GET /receptionists/1/edit
  def edit
  end

  # POST /receptionists
  # POST /receptionists.json
  def create
    @receptionist = Receptionist.new(receptionist_params)
    if @receptionist.save
      log_in @receptionist
      flash[:success] = "Welcome Receptionist!"
      redirect_to @receptionist
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
    def set_receptionist
      @receptionist = Receptionist.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def receptionist_params
      params.require(:receptionist).permit(:name, :email, :password,
                                    :password_confirmation)
    end
end
