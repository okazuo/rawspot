require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context 'ユーザー新規登録ができる場合' do
      it '全ての情報が存在すれば登録できる' do
        expect(@user).to be_valid
      end
      it 'パスワードが6字以上でも登録できる' do
        @user.password='123456aaabbb'
        @user.password_confirmation='123456aaabbb'
        expect(@user).to be_valid
      end
    end

    context 'ユーザー新規登録ができない場合' do
      it '名前が空では登録できない' do
        @user.name=''
        @user.valid?
        expect(@user.errors.full_messages).to include("名前を入力してください")
      end
      it 'メールアドレスが空では登録できない' do
        @user.email=''
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールを入力してください")
      end
      it '重複したメールアドレスが存在すれば登録できない' do
        @user.save
        another_user=FactoryBot.build(:user, email:@user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Eメールはすでに存在します")
      end
      it 'パスワードが空では登録できない' do
        @user.password=''
        @user.password_confirmation=''
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードを入力してください")
      end
      it 'パスワード（確認用）が空では登録できない' do
        @user.password_confirmation=''
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
      end
      it 'パスワードが数字のみでは登録できない' do
        @user.password='123456'
        @user.password_confirmation='123456'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは不正な値です")
      end
      it 'パスワードが英字のみでは登録できない' do
        @user.password='aaaaaa'
        @user.password_confirmation='aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは不正な値です")
      end
      it 'パスワードが５文字以下では登録できない' do
        @user.password='123ab'
        @user.password_confirmation='123ab'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは6文字以上で入力してください")
      end
      it 'パスワードが全角では登録できない' do
        @user.password='123ｂｂｂ'
        @user.password_confirmation='123ｂｂｂ'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは不正な値です")
      end
      it 'パスワードとパスワード（確認用）が不一致では登録できない' do
        @user.password='123ab'
        @user.password_confirmation='ab123'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません", "パスワードは6文字以上で入力してください")
      end
    end
  end
end
