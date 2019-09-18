class Article < ApplicationRecord
    acts_as_taggable
    acts_as_taggable_on :parts, :key_words

    belongs_to :user, dependent: :destroy

    # has_many :likes
    # has_many :liked_users, through: :likes, source: :user_id

    validates :title, presence: true, length:{ maximum: 50}
    validates :body, presence: true
    validates :part_list, presence: true

    attachment :article_image
end
