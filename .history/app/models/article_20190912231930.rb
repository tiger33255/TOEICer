class Article < ApplicationRecord

    attachment :article_image

    belongs_to :user, dependent: :destroy
end
