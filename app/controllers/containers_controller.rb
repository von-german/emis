class ContainersController < ApplicationController

	def index
    @users = User.where(role: 0)
    @containers = Container.all
    @receptionist ='receptionist'
  end

  def create
    if Container.between(params[:sender_id],params[:recipient_id]).present?
      @container = Container.between(params[:sender_id], params[:recipient_id]).first
    else
      @container = Container.create!(container_params)
    end
    redirect_to container_receipts_path(@container)
  end

  private
    def container_params
      params.permit(:sender_id, :recipient_id)
    end
end
