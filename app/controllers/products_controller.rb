class ProductsController < ApplicationController

  require 'payjp'

  def index
    @product = Product.all

    #レディース
    nums_ladies = Category.where(ancestry: '1/15').or(Category.where(ancestry: '1/16')).or(Category.where(ancestry: '1/17')).or(Category.where(ancestry: '1/18')).or(Category.where(ancestry: '1/19')).or(Category.where(ancestry: '1/20')).ids
    @ladies = Product.where(category_id: nums_ladies).order("created_at DESC").limit(10)
    

    #メンズ
    nums_mens = Category.where(ancestry: '2/80').or(Category.where(ancestry: '2/81')).or(Category.where(ancestry: '2/82')).or(Category.where(ancestry: '2/83')).or(Category.where(ancestry: '2/84')).ids
    @mens = Product.where(category_id: nums_mens).order("created_at DESC").limit(10)

    
    #家電・スマホ
    nums_elecs = Category.where(ancestry: '8/398').or(Category.where(ancestry: '8/399')).or(Category.where(ancestry: '8/400')).or(Category.where(ancestry: '8/401')).ids
    @elecs = Product.where(category_id: nums_elecs).order("created_at DESC").limit(10)


    #おもちゃ、ホビー
    nums_toys = Category.where(ancestry: '6/295').or(Category.where(ancestry: '6/296')).or(Category.where(ancestry: '6/297')).or(Category.where(ancestry: '6/298')).or(Category.where(ancestry: '6/299')).ids
    @toys = Product.where(category_id: nums_toys).order("created_at DESC").limit(10)


    #シャネル
    @chanel = Product.where(brand_id: 1).limit(10).order(created_at: "DESC")

    #ルイヴィトン
    @vuittons = Product.where(brand_id: 3).limit(10).order(created_at: "DESC")

    #ナイキ
    @nikes = Product.where(brand_id: 6).limit(10).order(created_at: "DESC")

    #シュプリーム
    @supremes = Product.where(brand_id: 4).limit(10).order(created_at: "DESC")

  end

  def show
    @product = Product.find(params[:id])
    @other_brands = Product.where(brand_id: @product.brand_id).where.not(id: @product.id)
    @other_myproducts = Product.where(user_id: @product.user_id).where.not(id: @product.id)
  end

  def buy_confirm
    @product = Product.new
    @product = Product.find_by(id: params[:format])
  end

  def purchase
    Payjp.api_key = ENV['PAYJP_ACCESS_KEY']

    @product = Product.find(params[:id])
    Payjp::Charge.create(
      amount: @product.price, # 決済する値段
      card: params['payjp-token'], # フォームを送信すると作成・送信されてくるトークン
      currency: 'jpy'
    )
    flash[:notice] = '購入しました' 
    redirect_to done_products_path
  end

  def done
  end

  
end
