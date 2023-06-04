class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  
  validates :nickname, presence: true
  validates :last_name, :first_name, presence: true
  validates :last_name, :first_name, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'は、全角（漢字・ひらがな・カタカナ）で入力してください' }
  validates :last_furigana, :first_furigana, presence: true
  validates :last_furigana, :first_furigana, format: { with: /\A[ァ-ヶー－]+\z/, message: 'は、全角のカタカナで入力してください' }
  validates :date_of_birth, presence: true
  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i, message: 'は、半角英数字混合で入力してください'}
end
