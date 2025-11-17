class Vote < ApplicationRecord
  belongs_to :book, touch: true

  validates :user_ref, presence: true
end
