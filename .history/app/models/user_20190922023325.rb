class User < ApplicationRecord
  acts_as_followable
  acts_as_follower
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  #deviseのログイン記憶
  def remember_me
    true
  end

  validates :word, length: {maximum: 30}
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :nickname, presence: true,
    length: {
      minimum: 1,
      maximum: 15
    }
  validates :toeic_score,
    numericality: {
      only_integer: true,
      greater_than: 0,
      less_than_or_equal_to: 990,
    }

  has_many :articles, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_articles, through: :likes, source: :article

  attachment :user_image

  def already_liked?(article)
    self.likes.exists?(article_id: article.id)
  end
end
