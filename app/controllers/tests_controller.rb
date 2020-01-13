class TestsController < ApplicationController
  #画像テスト用

  def index
    @tests = Test.all
  end

  def new
    @test = Test.new
  end

  def create
    @test = Test.new(test_params)

    if @test.save
      redirect_to root_url, notice: 'Add Test'
    else
      render :new
    end
  end

  private

  def test_params
    params.fetch(:test, {}).permit(:name, :image)
  end
end
