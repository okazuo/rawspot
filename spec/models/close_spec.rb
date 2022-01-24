require 'rails_helper'

RSpec.describe Close, type: :model do
  before do
    @close = FactoryBot.build(:close)
  end

  describe '取り扱い不可機能' do
    context '取り扱い不可にできる場合' do
      it '全てが存在すれば登録できる' do
        expect(@close).to be_valid
      end
    end

    context '取り扱い不可にできない場合' do
      it 'user_idが存在しなければ契約できない' do
        @close.user = nil
        @close.valid?
        expect(@close.errors.full_messages).to include('Userを入力してください')
      end
      it 'spot_idが存在しなければ契約できない' do
        @close.spot = nil
        @close.valid?
        expect(@close.errors.full_messages).to include('Spotを入力してください')
      end
    end
  end
end