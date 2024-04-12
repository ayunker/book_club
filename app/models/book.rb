# == Schema Information
#
# Table name: books
#
#  id         :bigint           not null, primary key
#  author     :string           not null
#  slug       :string           not null
#  title      :string           not null
#  url        :string           default(""), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  meeting_id :bigint           not null
#
# Indexes
#
#  index_books_on_meeting_id  (meeting_id)
#
# Foreign Keys
#
#  fk_rails_...  (meeting_id => meetings.id)
#
class Book < ApplicationRecord
  belongs_to :meeting
  has_many :votes, dependent: :destroy

  validates :title, presence: true
  validates :slug, presence: true
  validates :author, presence: true
  validates :url, presence: true

  before_validation :set_slug

  after_create_commit -> { broadcast_append_to meeting }
  after_update_commit -> { broadcast_replace_to meeting }

  def voted_by?(user_ref)
    votes.pluck(:user_ref).include?(user_ref)
  end

  private

  def set_slug
    # TODO: there's probably a better way of doing substitution
    self.slug = title.downcase.tr(" ", "-")
  end
end
