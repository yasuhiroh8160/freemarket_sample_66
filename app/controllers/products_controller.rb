class ProductsController < ApplicationController
  def index
    @product = Product.all

    #レディース
    nums_ladies = Category.where(ancestry: '1/15').or(Category.where(ancestry: '1/16')).or(Category.where(ancestry: '1/17')).or(Category.where(ancestry: '1/18')).or(Category.where(ancestry: '1/19')).or(Category.where(ancestry: '1/20')).ids
    @ladies = Product.where(category_id: nums_ladies).order("created_at DESC").limit(20)
    

    #メンズ
    nums_mens = Category.where(ancestry: '2/80').or(Category.where(ancestry: '2/81')).or(Category.where(ancestry: '2/82')).or(Category.where(ancestry: '2/83')).or(Category.where(ancestry: '2/84')).ids
    @mens = Product.where(category_id: nums_mens).order("created_at DESC").limit(20)

    
    #家電・スマホ
    nums_elecs = Category.where(ancestry: '8/398').or(Category.where(ancestry: '8/399')).or(Category.where(ancestry: '8/400')).or(Category.where(ancestry: '8/401')).ids
    @elecs = Product.where(category_id: nums_elecs).order("created_at DESC").limit(20)


    #おもちゃ、ホビー
    nums_toys = Category.where(ancestry: '6/295').or(Category.where(ancestry: '6/296')).or(Category.where(ancestry: '6/297')).or(Category.where(ancestry: '6/298')).or(Category.where(ancestry: '6/299')).ids
    @toys = Product.where(category_id: nums_toys).order("created_at DESC").limit(20)


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
  end

  def new
    @products = Product.new
  end

  def get_category_children
    #選択された親カテゴリーに紐付く子カテゴリーの配列を取得
    @category_children = Category.find_by(id: "#{params[:parent_id]}", ancestry: nil).children
 end

  def get_category_grandchildren
    #選択された子カテゴリーに紐付く孫カテゴリーの配列を取得
    @category_grandchildren = Category.find("#{params[:child_id]}").children
  end

  def get_shipping_PayFormer
    @shipping_payformer = Shipping.all
  end

  def get_shipping_PayGuest
    @shipping_payguest = Shipping.find(1,6,7,3)
  end


  def create
    
    @products = Product.new(create_params)
    if @products.save
      
    else
      @products = Product.new(create_params)
      render "new"
    end
  end

  private
  def create_params
    params.require(:product).permit(:name, :description, :condition_id, :term_id, :delivery_id, :shipping_id, :category_id, :fromprefecture_id, :price, :size_id, :brand_id, images: [])
  end



  def buy_confirm
  end
  
end
