class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :email, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :nickname, presence: true, length: { minimum: 3, maximum: 15 }
  validates :toeic_score, presence: true

  has_many :article, dependent: :destroy
  has_many :like, dependent: :destroy


end
