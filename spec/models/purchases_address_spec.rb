require 'rails_helper'

RSpec.describe PurchasesAddress, type: :model do
  describe '購入情報の保存' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      sleep 0.1
      @purchases_address = FactoryBot.build(:purchases_address, user_id: user.id,item_id: item.id)
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
        expect(@purchases_address.errors.full_messages).to include("郵便番号を入力してください")
      end
      it 'post_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @purchases_address.post_code = '1234567890'
        @purchases_address.valid?
        expect(@purchases_address.errors.full_messages).to include("郵便番号半角文字列とハイフンが含まれていること")
      end

      it 'delivery_area_idが１だと保存できないこと' do
        @purchases_address.delivery_area_id = 1
        @purchases_address.valid?
        expect(@purchases_address.errors.full_messages).to include("都道府県を入力してください")
      end
      it 'municipalitiesが空だと保存できないこと' do
        @purchases_address.municipalities = nil
        @purchases_address.valid?
        expect(@purchases_address.errors.full_messages).to include("市区町村を入力してください")
      end
      it 'house_numberが空だと保存できないこと' do
        @purchases_address.house_number = nil
        @purchases_address.valid?
        expect(@purchases_address.errors.full_messages).to include("番地を入力してください")
      end
      it 'telephone_numberが空だと保存できないこと' do
        @purchases_address.telephone_number = nil
        @purchases_address.valid?
        expect(@purchases_address.errors.full_messages).to include("電話番号を入力してください", "電話番号は不正な値です")
                                                                   
      end
      it 'telephone_numberが10桁以上11桁以内の数値でないと保存できないこと' do
        @purchases_address.telephone_number = '111'
        @purchases_address.valid?
        expect(@purchases_address.errors.full_messages).to include("電話番号は不正な値です")
      end
      it 'telephone_numberが半角数値でないと保存できないこと' do
        @purchases_address.telephone_number = '４４４４４４４４９'
        @purchases_address.valid?
        expect(@purchases_address.errors.full_messages).to include("電話番号は不正な値です")
      end
      it 'telephone_numberが12桁以上だと保存できないこと' do
        @purchases_address.telephone_number = '１２３４５６７８９０１２'
        @purchases_address.valid?
        expect(@purchases_address.errors.full_messages).to include("電話番号は不正な値です")
      end

      it 'userが紐付いていないと保存できないこと' do
        @purchases_address.user_id = nil
        @purchases_address.valid?
        expect(@purchases_address.errors.full_messages).to include("Userを入力してください")
      end

      it 'userが紐付いていないと保存できないこと' do
        @purchases_address.item_id = nil
        @purchases_address.valid?
        expect(@purchases_address.errors.full_messages).to include("Itemを入力してください")
      end

      it 'tokenが空では登録できないこと' do
        @purchases_address.token = nil
        @purchases_address.valid?
        expect(@purchases_address.errors.full_messages).to include("クレジットカード情報を入力してください")
      end
    end
  end
end
