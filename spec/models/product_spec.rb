require 'rails_helper'
describe Product do
  describe '#create' do
    # 1. nicknameとemail、passwordとpassword_confirmationが存在すれば登録できること
    it "is valid with a name, price, description, term_id, size_id, condition_id, shipping_id, delivery_id, fromprefecture_id, category_id" do
      user = build(:user)
      expect(user).to be_valid
    end

    it "is invalid without a name" do
      product = build(:product, name: nil)
      product.valid?
      expect(product.errors[:name]).to include("can't be blank")
    end

    it "is invalid without a price" do
      product = build(:product, price: nil)
      product.valid?
      expect(product.errors[:price]).to include("can't be blank")
    end

    it "is invalid without a description" do
      product = build(:product, description: nil)
      product.valid?
      expect(product.errors[:description]).to include("can't be blank")
    end

    it "is invalid without a term_id" do
      product = build(:product, term_id: nil)
      product.valid?
      expect(product.errors[:term_id]).to include("can't be blank")
    end

    it "is invalid without a size_id" do
      product = build(:product, size_id: nil)
      product.valid?
      expect(product.errors[:size_id]).to include("can't be blank")
    end

    it "is invalid without a condition_id" do
      product = build(:product, condition_id: nil)
      product.valid?
      expect(product.errors[:condition_id]).to include("can't be blank")
    end

    it "is invalid without a shipping_id" do
      product = build(:product, shipping_id: nil)
      product.valid?
      expect(product.errors[:shipping_id]).to include("can't be blank")
    end

    it "is invalid without a delivery_id" do
      product = build(:product, delivery_id: nil)
      product.valid?
      expect(product.errors[:delivery_id]).to include("can't be blank")
    end

    it "is invalid without a fromprefecture_id" do
      product = build(:product, fromprefecture_id: nil)
      product.valid?
      expect(product.errors[:fromprefecture_id]).to include("can't be blank")
    end

    it "is invalid without a category_id" do
      product = build(:product, category_id: nil)
      product.valid?
      expect(product.errors[:category_id]).to include("can't be blank")
    end
  end
end