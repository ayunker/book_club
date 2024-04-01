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

  private

  def set_slug
    # TODO: there's probably a better way of doing substitution
    self.slug = title.downcase.tr(" ", "-")
  end
end
