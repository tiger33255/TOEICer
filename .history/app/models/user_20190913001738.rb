class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  #deviseのログイン記憶
  def remember_me
    true
  end

  validates :email, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :nickname, presence: true, length: { minimum: 3, maximum: 15 }
  validates :toeic_score, presence: true
  validates :image, presence: true

  has_many :articles, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_aricles, through: :likes, source: :articles

end
