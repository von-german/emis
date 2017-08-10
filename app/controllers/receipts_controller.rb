class ReceiptsController < ApplicationController
  def index
    @receipts = Receipt.all
  end

  def show
    @receipt = Receipt.find(params[:id])
  end

  def new
    @receipt = Receipt.new
  end

  def create
    @receipt = Receipt.new(receipt_params)
    if @receipt.save
      flash.now[:success] = "Receipt created!"
      redirect_to @receipt
    else
      render 'new'
    end
  end

  def edit
    @receipt = Receipt.find(params[:id])
  end

  def update
    @receipt = Receipt.find(params[:id])
    if @receipt.update_attributes(receipt_params)
      flash[:success] = "Receipt updated"
      redirect_to @receipt
    else
      render 'edit'
    end
  end

  def destroy
    @receipt = Receipt.find(params[:id])
    @receipt.destroy
    redirect_to receipts_path, :notice => 'Receipt deleted'
  end

  private

    def receipt_params
      params.require(:receipt).permit(:amount_owed, :items, :user_id)
    end
end
