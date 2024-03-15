class Book < ApplicationRecord
  validates :title, presence: true
  validates :slug, presence: true
  validates :author, presence: true
  validates :description, presence: true

  before_validation :set_slug

  private

  def set_slug
    # TODO: there's probably a better way of doing substitution
    self.slug = title.downcase.tr(" ", "-")
  end
end
