class Article < ApplicationRecord
    include Visible

    belongs_to :author

    has_many :comments, dependent: :restrict_with_error

    validates :title, presence: true
    validates :body, presence: true, length: { minimum: 10 }
    validates :author_id, presence: true
end
