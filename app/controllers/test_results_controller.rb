class TestResultsController < ApplicationController
  def index
    @test_results = TestResult.all
  end

  def show
    @test_result = TestResult.find(params[:id])
  end

  def new
    @test_result = TestResult.new
  end

  def create
    @test_result = TestResult.new(test_result_params)
    if @test_result.save
      flash[:success] = 'Result saved!'
      redirect_to @test_result
    else
      render 'new'
    end
  end

  def edit
    @test_result = TestResult.find(params[:id])
  end

  def update
    @test_result = TestResult.find(params[:id])
    if @test_result.update_attributes(test_result_params)
      flash[:success] = 'Result updated!'
      redirect_to @test_result
    else
      render 'edit'
    end
  end

  def destroy
    @test_result = TestResult.find(params[:id])
    @test_result.destroy
    redirect_to test_results_path :notice => 'Result deleted'
  end

  private

    def test_result_params
      params.require(:test_result).permit(:test_type, :test_info, :user_id)
    end
end
