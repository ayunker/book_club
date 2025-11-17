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
    return false if meeting.locked?
    meeting.books.includes(:votes).map { _1.voted_by?(user_ref) }.none?
  end

  private

  def set_slug
    self.slug = title.parameterize
  end
end
