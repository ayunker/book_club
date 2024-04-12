class Vote < ApplicationRecord
  belongs_to :book

  validates :user_ref, presence: true

  after_create_commit -> { book.touch }
  after_destroy_commit -> { book.touch }
end
