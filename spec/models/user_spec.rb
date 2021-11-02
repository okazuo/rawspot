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
        expect(@user.errors.full_messages).to include("Name can't be blank")
      end
      it 'メールアドレスが空では登録できない' do
        @user.email=''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it '重複したメルアドレスが存在すれば登録できない' do
        @user.save
        another_user=FactoryBot.build(:user, email:@user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it 'パスワードが空では登録できない' do
        @user.password=''
        @user.password_confirmation=''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'パスワード（確認用）が空では登録できない' do
        @user.password_confirmation=''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'パスワードが数字のみでは登録できない' do
        @user.password='123456'
        @user.password_confirmation='123456'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it 'パスワードが英字のみでは登録できない' do
        @user.password='aaaaaa'
        @user.password_confirmation='aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it 'パスワードが５文字以下では登録できない' do
        @user.password='123ab'
        @user.password_confirmation='123ab'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it 'パスワードが全角では登録できない' do
        @user.password='123ｂｂｂ'
        @user.password_confirmation='123ｂｂｂ'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it 'パスワードとパスワード（確認用）が不一致では登録できない' do
        @user.password='123ab'
        @user.password_confirmation='ab123'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
    end
  end
end
