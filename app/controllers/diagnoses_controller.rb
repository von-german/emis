class DiagnosesController < ApplicationController
  def index
    @diagnoses = Diagnosis.all
  end

  def show
    @diagnosis = Diagnosis.find(params[:id])
  end

  def new
    @diagnosis = Diagnosis.new
  end

  def create
    @diagnosis = Diagnosis.new(diagnosis_params)
    if @diagnosis.save
      flash.now[:success] = "Diagnosis saved!"
      redirect_to diagnoses_path
    else
      flash[:danger] = "Diagnosis not saved"
      render 'new'
    end
  end

  def edit
    @diagnosis = Diagnosis.find(params[:id])
  end

  def update
    @diagnosis =  Diagnosis.find(params[:id])
    if @diagnosis.update(diagnosis_params)
      flash[:success] = "Diagnosis updated"
      redirect_to diagnoses_path
    else
      render 'edit'
    end
  end

  def destroy
    @diagnosis = Diagnosis.find(params[:id])
    @diagnosis.destroy
    redirect_to diagnoses_path, :notice => "Diagnosis Deleted"
  end

  private

    def diagnosis_params
      params.require(:diagnosis).permit(:condition, :prescription, :user_id)
    end
end
