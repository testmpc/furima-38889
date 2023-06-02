require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できる場合' do

      it "全て入力すれば登録できる" do
        expect(@user).to be_valid
      end

    end
    context '新規登録できない場合' do

      it "nicknameが空では登録できない" do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end

      it "emailが空では登録できない" do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it '重複したemailが存在する場合は登録できない' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end

      it 'emailは@を含まないと登録できない' do
        @user.email = 'testmail'
        @user.valid?
        # binding.pry
        expect(@user.errors.full_messages).to include('Email is invalid')
      end

      it "passwordが空では登録できない" do
        @user.password = ''
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it "passwordは6文字以上でないと登録できない" do
        @user.password = '1qaz'
        @user.password_confirmation = @user.password
        @user.valid?
        # binding.pry
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end

      it "passwordは英数字混合でないと登録できない" do
        @user.password = 'testtest'
        @user.password_confirmation = @user.password
        @user.valid?
        # binding.pry
        expect(@user.errors.full_messages).to include("Password は、半角英数字混合で入力してください")
      end

      it "passwordとpasswordconfirmationは同じでないと登録できない" do
        @user.password = '3edc4rfv'
        @user.password_confirmation = '1qaz2wsx'
        @user.valid?
        # binding.pry
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it "お名前(全角)は苗字と名前を入力しないと登録できない" do
        @user.last_name = ''
        @user.valid?
        # binding.pry
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it "お名前(全角)は苗字と名前を入力しないと登録できない" do
        @user.first_name = ''
        @user.valid?
        # binding.pry
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end

      it "お名前(全角)は全角（漢字・ひらがな・カタカナ）でないと登録できない" do
        @user.last_name = 'test'
        @user.valid?
        # binding.pry
        expect(@user.errors.full_messages).to include("Last name は、全角（漢字・ひらがな・カタカナ）で入力してください")
      end
      it "お名前(全角)は全角（漢字・ひらがな・カタカナ）でないと登録できない" do
        @user.first_name = 'test'
        @user.valid?
        # binding.pry
        expect(@user.errors.full_messages).to include("First name は、全角（漢字・ひらがな・カタカナ）で入力してください")
      end

      it "お名前カナ(全角)苗字と名前を入力しないと登録できない" do
        @user.last_furigana = ''
        @user.valid?
        # binding.pry
        expect(@user.errors.full_messages).to include("Last furigana can't be blank")
      end
      it "お名前カナ(全角)苗字と名前を入力しないと登録できない" do
        @user.first_furigana = ''
        @user.valid?
        # binding.pry
        expect(@user.errors.full_messages).to include("First furigana can't be blank")
      end

      it "お名前カナ(全角)は全角（カタカナ）でないと登録できない" do
        @user.last_furigana = 'てすと'
        @user.valid?
        # binding.pry
        expect(@user.errors.full_messages).to include("Last furigana は、全角のカタカナで入力してください")
      end
      it "お名前カナ(全角)は全角（カタカナ）でないと登録できない" do
        @user.first_furigana = 'てすと'
        @user.valid?
        # binding.pry
        expect(@user.errors.full_messages).to include("First furigana は、全角のカタカナで入力してください")
      end

      it "生年月日が空だと登録できない" do
        @user.date_of_birth = ''
        @user.valid?
        # binding.pry
        expect(@user.errors.full_messages).to include("Date of birth can't be blank")
      end
    end
  end
end