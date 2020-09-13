class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  with_options presence: true do       
    validates :email, uniqueness: true
    validates :email, inclusion: {in: /[@]/}
    validates :password, format: {with: /\A(?=.*?a-z)(?=.*?[\d])[a-z\d]+\z/i}
    validates :password, length:{minimum: 6}
    with_options presence: true, format: { with: /\A[ぁ-んァ-ンー-龥]+\z/} do
      validates :last_name_kanzi
      validates :first_name_kanzi
    end
    with_options presence: true, format: { with: /\A[ァ-ン]+\z/} do
      validates :last_name_kana
      validates :first_name_kana
    end
    validates :birthday
  end
end
