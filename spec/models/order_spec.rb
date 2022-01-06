require 'rails_helper'

RSpec.describe Order, type: :model do
  before do
    @order = FactoryBot.build(:order)
  end

  describe '物件契約機能' do
    context '物件を契約できる場合' do
      it 'お客様名が存在すれば契約できる' do
        expect(@order).to be_valid
      end
    end

    context '物件を契約できない場合' do
      it 'お客様名が存在しなければ契約できない' do
        @order.customer = ''
        @order.valid?
        expect(@order.errors.full_messages).to include('お客様名を入力してください')
      end
      it 'お客様名が空白スペースだと契約できない' do
        @order.customer = '　'
        @order.valid?
        expect(@order.errors.full_messages).to include('お客様名を入力してください')
      end
      it 'user_idが存在しなければ契約できない' do
        @order.user = nil
        @order.valid?
        expect(@order.errors.full_messages).to include('Userを入力してください')
      end
      it 'spot_idが存在しなければ契約できない' do
        @order.spot = nil
        @order.valid?
        expect(@order.errors.full_messages).to include('Spotを入力してください')
      end
    end
  end
end
