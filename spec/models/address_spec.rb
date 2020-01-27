require 'rails_helper'
describe Address do
  describe '#create_address' do

    it "is valid with a zipcode, prefecture, city, district, building" do
      address = build(:address)
      expect(address).to be_valid
    end
    
    it "is invalid without a zipcode" do
      address = build(:address, zipcode: nil)
      address.valid?
      expect(address.errors[:zipcode]).to include("can't be blank")
    end

    it "is invalid without a prefecture" do
      address = build(:address, prefecture: nil)
      address.valid?
      expect(address.errors[:prefecture]).to include("can't be blank")
    end

    it "is invalid without a city" do
      address = build(:address, city: nil)
      address.valid?
      expect(address.errors[:city]).to include("can't be blank")
    end

    it "is invalid without a district" do
      address = build(:address, district: nil)
      address.valid?
      expect(address.errors[:district]).to include("can't be blank")
    end

    it "is invalid without a building" do
      address = build(:address, building: nil)
      address.valid?
      expect(address.errors[:building]).to include("can't be blank")
    end

  end
end