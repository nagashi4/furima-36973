require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
  describe '出品' do
    context '出品できる場合' do
      it '全ての項目が入力されていれば出品できる' do
        expect(@item).to be_valid
      end
    end
    context '出品できない場合' do
      it 'nameが空では登録できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("商品名を入力してください")
      end
      it 'versionが空では登録できない' do
        @item.version = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("商品説明を入力してください")
      end
      it 'priceが空では登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("値段を入力してください")
      end
      it 'category_idが1では登録できない' do
        @item.category_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("カテゴリーを入力してください")
      end
      it 'situation_idが1では登録できない' do
        @item.situation_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("商品の状態を入力してください")
      end
      it 'delivery_charage_idが1では登録できない' do
        @item.delivery_charge_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("配送料の負担を入力してください")
      end
      it 'delivery_area_idが1では登録できない' do
        @item.delivery_area_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("発送元の地域を入力してください")
      end
      it 'delivery_days_idが1では登録できない' do
        @item.delivery_days_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("発送までの日数を入力してください")
      end
      it 'imageが空では保存できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("画像を入力してください")
      end

      it 'userが紐付いていないと保存できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Userを入力してください")
      end
      it 'priceに半角英数位が含まれている場合は登録できない' do
        @item.price = 'a'
        @item.valid?
        expect(@item.errors.full_messages).to include("値段は数値で入力してください")
      end
      it 'priceが300未満では登録できない' do
        @item.price = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("値段は300以上の値にしてください")
      end
      it 'priceが9999999以上では登録できない' do
        @item.price = '10000000000'
        @item.valid?
        expect(@item.errors.full_messages).to include("値段は9999999以下の値にしてください")
      end
    end
  end
end
