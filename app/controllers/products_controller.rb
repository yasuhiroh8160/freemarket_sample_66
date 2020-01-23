class ProductsController < ApplicationController
  def index
  end

  def show
    # 実際に表示することができるか確認するために、id: 1 を入力してます
    @product = Product.find(1)
    # @product = Product.find(params[:id])

  end

  def buy_confirm
  end
  
end
