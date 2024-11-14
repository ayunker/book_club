# == Schema Information
#
# Table name: meetings
#
#  id         :integer          not null, primary key
#  locked_at  :datetime
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

  def locked?
    locked_at.present?
  end

  def toggle_lock!
    locked? ? unlock! : lock!
  end

  def lock!
    update(locked_at: Time.current)
  end

  def unlock!
    update(locked_at: nil)
  end

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
