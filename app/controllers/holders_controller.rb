class HoldersController < ApplicationController
	#before_action :authenticate_user

  def index
    authorize Holder
    @users = User.where(role: 0)
    @holders = Holder.all
    @doctor ='doctor'
  end

  def create
    @holder = Holder.create!(holder_params)
    redirect_to holder_prescriptions_path(@holder)
  end

  private
    def holder_params
      params.permit(:sender_id, :recipient_id)
    end
end
