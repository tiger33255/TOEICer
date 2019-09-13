class Article < ApplicationRecord

    attachment :article_image

    belongs_to :user, dependent: :destroy

    has_many :likes
    has_many :liked_users, through: :likes, source: :user_id


end
