require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品の登録' do
    context '商品の登録がうまくいくとき' do
      it '画像、商品名、商品の説明、カテゴリー、商品の状態、配送料の負担、発送元の地域、発送までの日数、価格についての情報があれば商品は登録される' do
        expect(@item).to be_valid
      end
    end
    context '商品の登録がうまくいかないとき' do
      it '画像がないと登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")

      end
      it '商品名がないと登録できない' do
        @item.name = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it '商品の説明がないと登録できない' do
        @item.explanation = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Explanation can't be blank")
      end
      it 'カテゴリーの情報がないと登録できない' do
        @item.category_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank", "Category is not a number")
      end
      it '商品の状態が空だと登録できない' do
        @item.status_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Status can't be blank", "Status is not a number")
      end
      it '配送料の負担が空だと登録できない' do
        @item.delivery_fee_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery fee can't be blank", "Delivery fee is not a number")
      end
      it '発送元の地域が空だと登録できない' do
        @item.delivery_area_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery area can't be blank", "Delivery area is not a number")
      end
      it '発送までの日数が空だと登録できない' do
        @item.delivery_day_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery day can't be blank", "Delivery day is not a number")
      end
      it '価格が空だと登録できない' do
        @item.price = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank", "Price is not a number", "Price is invalid")
      end
      it '価格が300円以下だと登録できない' do
        @item.price = "200"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end
      it '価格が9,999,999円以上だと登録できない' do
        @item.price = "10000000"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end
      it '価格が半角数字のみで入力されていないと登録できない' do
        @item.price = " ３００"
         @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
    end
  end
end
      
      

