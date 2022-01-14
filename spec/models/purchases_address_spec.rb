require 'rails_helper'

RSpec.describe PurchasesAddress, type: :model do
  describe '購入情報の保存' do
    before do
      user = FactoryBot.create(:user)
      @purchases_address = FactoryBot.build(:purchases_address, user_id: user.id)
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@purchases_address).to be_valid
      end
      
      it 'building_nameは空でも保存できること' do
        @purchases_address.building_name = ''
        expect(@purchases_address).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'post_codeが空だと保存できないこと' do
        @purchases_address.post_code = ''
        @purchases_address.valid?
        expect(@purchases_address.errors.full_messages).to include("Post code can't be blank")
      end
      it 'post_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @purchases_address.post_code = '1234567890'
        @purchases_address.valid?
        expect(@purchases_address.errors.full_messages).to include('Post code is invalid. Include hyphen(-)')
      end

      it 'delivery_area_idが１だと保存できないこと' do
        @purchases_address.delivery_area_id = 1
        @purchases_address.valid?
        expect(@purchases_address.errors.full_messages).to include("Delivery area can't be blank")
      end
      it 'municipalitiesが空だと保存できないこと' do
        @purchases_address.municipalities = nil
        @purchases_address.valid?
        expect(@purchases_address.errors.full_messages).to include("Municipalities can't be blank")
      end
      it 'house_numberが空だと保存できないこと' do
        @purchases_address.house_number = nil
        @purchases_address.valid?
        expect(@purchases_address.errors.full_messages).to include("House number can't be blank")
      end
      it 'telephone_numberが空だと保存できないこと' do
        @purchases_address.telephone_number = nil
        @purchases_address.valid?
        expect(@purchases_address.errors.full_messages).to include("Telephone number can't be blank", "Telephone number is invalid")
      end
      it 'telephone_numberが10桁以上11桁以内の数値でないと保存できないこと' do
        @purchases_address.telephone_number = '111'
        @purchases_address.valid?
        expect(@purchases_address.errors.full_messages).to include("Telephone number is invalid")
      end
      it 'telephone_numberが半角数値でないと保存できないこと' do
        @purchases_address.telephone_number = '４４４４４４４４９'
        @purchases_address.valid?
        expect(@purchases_address.errors.full_messages).to include("Telephone number is invalid")
      end

      it 'userが紐付いていないと保存できないこと' do
        @purchases_address.user_id = nil
        @purchases_address.valid?
        expect(@purchases_address.errors.full_messages).to include("User can't be blank")
      end
    end
  end
end
