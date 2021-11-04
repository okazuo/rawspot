require 'rails_helper'

RSpec.describe Spot, type: :model do
  before do
    @spot = FactoryBot.build(:spot)
  end

  describe '物件投稿機能' do
    context '物件が投稿できる場合'do
      it '全て情報が存在すれば登録できる。' do
        expect(@spot).to be_valid
      end
      it '面積が存在しなくても登録できる' do
        @spot.size= ''
        expect(@spot).to be_valid
      end
      it '面積が小数点でも登録できる' do
        @spot.size= 1234.6789
        expect(@spot).to be_valid
      end
      it '価格が存在しなくても登録できる' do
        @spot.price= ''
        expect(@spot).to be_valid
      end
      it '価格が小数点でも登録できる' do
        @spot.price= 12345.6789
        expect(@spot).to be_valid
      end
      it '写真が存在しなくても登録できる' do
        @spot.image= nil
        expect(@spot).to be_valid
      end
      it '備考が存在しなくても登録できる' do
        @spot.explanation= ''
        expect(@spot).to be_valid
      end
      it '面積、価格、写真、備考が存在しなくても登録できる' do
        @spot.size= ''
        @spot.price= ''
        @spot.image= nil
        @spot.explanation= ''
        expect(@spot).to be_valid
      end
    end

    context '物件が投稿できない場合'do
      it '取り扱い業者が存在しなければ登録できない' do
        @spot.estate_agent=''
        @spot.valid?
        expect(@spot.errors.full_messages).to include("Estate agent can't be blank")
      end
      it '取り扱い業者が51字以上であれば登録できない' do
        @spot.estate_agent='あいうえお'*10+'あ'
        @spot.valid?
        expect(@spot.errors.full_messages).to include("Estate agent is too long (maximum is 50 characters)")
      end
      it '住所が存在しなければ登録できない' do
        @spot.address=''
        @spot.valid?
        expect(@spot.errors.full_messages).to include("Address can't be blank")
      end
      it '住所が51字以上であれば登録できない' do
        @spot.address='あいうえお'*10+'あ'
        @spot.valid?
        expect(@spot.errors.full_messages).to include("Address is too long (maximum is 50 characters)")
      end
      it '水道管設備を選択しなければ登録できない' do
        @spot.water_id = 1
        @spot.valid?
        expect(@spot.errors.full_messages).to include("Water can't be blank")
      end
      it '公図を選択しなければ登録できない' do
        @spot.officialmap_id = 1
        @spot.valid?
        expect(@spot.errors.full_messages).to include("Officialmap can't be blank")
      end
      it '謄本を選択しなければ登録できない' do
        @spot.transcript_id = 1
        @spot.valid?
        expect(@spot.errors.full_messages).to include("Transcript can't be blank")
      end
      it '物件に関する問い合わせ先を選択しなければ登録できない' do
        @spot.contact_id = 1
        @spot.valid?
        expect(@spot.errors.full_messages).to include("Contact can't be blank")
      end
      it '面積が10000以上であれば登録できない' do
        @spot.size = 10000
        @spot.valid?
        expect(@spot.errors.full_messages).to include("Size is too long (maximum is 4 characters)")
      end
      it '面積が全角では登録できない' do
        @spot.size = '１００'
        @spot.valid?
        expect(@spot.errors.full_messages).to include("Size is not a number")
      end
      it '面積に文字が含まれていれば登録できない' do
        @spot.size = 'あいう'
        @spot.valid?
        expect(@spot.errors.full_messages).to include("Size is not a number")
      end
      it '価格が100000以上であれば登録できない' do
        @spot.price = 100000
        @spot.valid?
        expect(@spot.errors.full_messages).to include("Price is too long (maximum is 5 characters)")
      end
      it '価格が全角であれば登録できない' do
        @spot.price = '１００'
        @spot.valid?
        expect(@spot.errors.full_messages).to include("Price is not a number")
      end
      it '価格に文字が含まれていれば登録できない' do
        @spot.price = '10a'
        @spot.valid?
        expect(@spot.errors.full_messages).to include("Price is not a number")
      end
      it '備考欄が1001字以上であれば登録できない' do
        @spot.explanation = 'あいうえお'*200+'あ'
        @spot.valid?
        expect(@spot.errors.full_messages).to include("Explanation is too long (maximum is 1000 characters)")
      end
      it 'ユーザーが紐づいていないと登録できない' do
        @spot.user = nil
        @spot.valid?
        expect(@spot.errors.full_messages).to include("User must exist")
      end
    end
  end
end
