class Like < ApplicationRecord

    belongs_to :user, dependent: :destroy
    belongs_to :article, dependent: :destroy
    validates_uniqueness_of :article_id, scope: :user_id

end
