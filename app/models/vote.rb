# == Schema Information
#
# Table name: votes
#
#  id         :bigint           not null, primary key
#  user_ref   :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  book_id    :bigint           not null
#
# Indexes
#
#  index_votes_on_book_id  (book_id)
#
# Foreign Keys
#
#  fk_rails_...  (book_id => books.id)
#
class Vote < ApplicationRecord
  belongs_to :book, touch: true

  validates :user_ref, presence: true
end
