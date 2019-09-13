class Article < ApplicationRecord

    attachment :article_image

    belongs_to :user, dependent: :destroy

    has_many :likes
end
