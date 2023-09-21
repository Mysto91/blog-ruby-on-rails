class Article < ApplicationRecord
    include Visible

    has_many :comments, dependent: :restrict_with_error

    validates :title, presence: true
    validates :body, presence: true, length: { minimum: 10 }
end
