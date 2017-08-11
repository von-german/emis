class ReceiptsController < ApplicationController
	before_action do
    @container = Container.find(params[:container_id])
  end

  def index
    @receptionist = 'receptionist'
    @receipts = @container.receipts
      if @receipts.length > 10
        @over_ten = true
        @receipts = @receipts[-10..-1]
      end

      if params[:m]
        @over_ten = false
        @receipts = @container.receipts
      end

      if @receipts.last
        if @receipts.last.user_id != current_user.id
          @receipts.last.read = true;
        end
      end

      @receipt = @container.receipts.new
    end

    def new
      @receipt = @container.receipts.new
    end

    def create
      @receipt = @container.receipts.new(receipt_params)
      if @receipt.save
        redirect_to container_receipts_path(@container)
      end
    end


    private
      def receipt_params
        params.require(:receipt).permit(:price,:items, :user_id)
      end
end
