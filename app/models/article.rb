class Article < ActiveRecord::Base
  belongs_to :user
  has_many :comments

  acts_as_taggable

  paginates_per 5

  before_save :ensure_published_at
  before_create :ensure_published_at

  scope :published, -> { where(is_published: true) }

  def ensure_published_at
    self.published_at = created_at if published_at.blank?
  end
end
