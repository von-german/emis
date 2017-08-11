class PrescriptionsController < ApplicationController
  before_action do
   @holder = Holder.find(params[:holder_id])
  end

  def index
    authorize Holder
    @doctor = 'doctor'
    @prescriptions = @holder.prescriptions
      if @prescriptions.length > 10
        @over_ten = true
        @messsages = @prescriptions[-10..-1]
      end

      if params[:m]
        @over_ten = false
        @prescriptions = @holder.prescriptions
      end

      if @prescriptions.last
        if @prescriptions.last.user_id != current_user.id
          @prescriptions.last.read = true;
        end
      end

      @prescription = @holder.prescriptions.new
    end

    def new
      @prescription = @holder.prescriptions.new
    end

    def create
      @prescription = @holder.prescriptions.new(prescription_params)
      if @prescription.save
        redirect_to holder_prescriptions_path(@holder)
      end
    end


    private
      def prescription_params
        params.require(:prescription).permit(:drug,:condition, :user_id)
      end
    end
