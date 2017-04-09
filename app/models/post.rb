class Post < ApplicationRecord
  validates :title, presence: true, length: { in: 3..50 }
  validates :body, presence: true, length: { minimum: 20 }
end
