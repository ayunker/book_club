# == Schema Information
#
# Table name: meetings
#
#  id         :bigint           not null, primary key
#  name       :string
#  slug       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_meetings_on_slug  (slug) UNIQUE
#
class Meeting < ApplicationRecord
  has_many :books, dependent: :destroy

  before_save :set_slug

  def leading_book
    books.left_joins(:votes).group(:id).order("count(books.id) desc").first
  end

  def previous_month
    Meeting.where(id: Float::INFINITY...id).max
  end

  private

  def set_slug
    self.slug = name.parameterize
  end
end
