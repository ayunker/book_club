class Meeting < ApplicationRecord
  has_many :books, dependent: :destroy
end
