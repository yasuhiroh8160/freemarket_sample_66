require 'rails_helper'
describe SnsCredential do
  describe '#user_params' do

    before do
      user = create(:user , id: 2)
    end

    context "can save" do
      it "is valid with a a provider, a uid, a user_id" do
        sns = build(:sns_credential)
        expect(sns).to be_valid
      end
    end
    
    context "can not save" do

      it "is invalid without a provider" do
        sns = build(:sns_credential, provider: nil)
        sns.valid?
        expect(sns.errors[:provider]).to include("can't be blank")
      end
  
      it "is invalid without a uid" do
        sns = build(:sns_credential, uid: nil)
        sns.valid?
        expect(sns.errors[:uid]).to include("can't be blank")
      end
  
      it "is invalid without a user_id" do
        sns = build(:sns_credential, user_id: nil)
        sns.valid?
        expect(sns.errors[:user_id]).to include("can't be blank")
      end
    end


  end
end

