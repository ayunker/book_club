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

  private

  def set_slug
    self.slug = name.downcase.tr(" ", "-")
  end
end
