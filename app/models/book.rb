# == Schema Information
#
# Table name: books
#
#  id         :integer          not null, primary key
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
#  meeting_id  (meeting_id => meetings.id)
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

  def can_receive_vote?(user_ref)
    meeting.books.includes(:votes).map { _1.voted_by?(user_ref) }.none?
  end

  private

  def set_slug
    self.slug = title.parameterize
  end
end
