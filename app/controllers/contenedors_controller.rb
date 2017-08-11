class ContenedorsController < ApplicationController
	def index
    @users = User.where(role: 0)
    @contenedors = Contenedor.all
    @nurse ='nurse'
  end

  def create
    @contenedor = Contenedor.create!(contenedor_params)
    redirect_to contenedor_test_results_path(@contenedor)
  end

  private
    def contenedor_params
      params.permit(:sender_id, :recipient_id)
    end
end
