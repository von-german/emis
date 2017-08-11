class TestResultsController < ApplicationController
		before_action do
    @contenedor = Contenedor.find(params[:contenedor_id])
  end

  def index
    @nurse = 'nurse'
    @test_results = @contenedor.test_results
      if @test_results.length > 10
        @over_ten = true
        @test_results= @test_results[-10..-1]
      end

      if params[:m]
        @over_ten = false
        @test_results = @contenedor.test_results
      end

      if @test_results.last
        if @test_results.last.user_id != current_user.id
          @test_results.last.read = true;
        end
      end

      @test_result = @contenedor.test_results.new
    end

    def new
      @test_result = @contenedor.test_results.new
    end

    def create
      @test_result = @contenedor.test_results.new(test_result_params)
      if @test_result.save
        redirect_to contenedor_test_results_path(@contenedor)
      end
    end


    private
      def test_result_params
        params.require(:test_result).permit(:test_type,:test_info, :user_id)
      end
end
