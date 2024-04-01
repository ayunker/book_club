class Vote < ApplicationRecord
  belongs_to :book

  validates :user_ref, presence: true
end
