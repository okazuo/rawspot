require 'rails_helper'

RSpec.describe Comment, type: :model do
  before do
    @comment = FactoryBot.build(:comment)
  end

  describe 'コメント投稿機能' do
    context 'コメントを投稿できる場合' do
      it 'コメントが存在すれば契約できる' do
        expect(@comment).to be_valid
      end
    end

    context 'コメントを投稿できない場合' do
      it 'コメントが存在しなければ投稿できない' do
        @comment.text = ''
        @comment.valid?
        expect(@comment.errors.full_messages).to include('Textを入力してください')
      end
      it 'コメントが空白スペースだと投稿できない' do
        @comment.text = '　'
        @comment.valid?
        expect(@comment.errors.full_messages).to include('Textを入力してください')
      end
      it 'user_idが存在しなけれ投稿できない' do
        @comment.user = nil
        @comment.valid?
        expect(@comment.errors.full_messages).to include('Userを入力してください')
      end
      it 'spot_idが存在しなければ投稿できない' do
        @comment.spot = nil
        @comment.valid?
        expect(@comment.errors.full_messages).to include('Spotを入力してください')
      end
    end
  end
end
