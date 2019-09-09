class Cocktail < ApplicationRecord
  include PgSearch::Model

  has_many :doses, dependent: :destroy
  has_many :ingredients, through: :doses

  validates :name, presence: true
  validates :name, uniqueness: true

  mount_uploader :photo, PhotoUploader

  pg_search_scope :search_by_name,
                  against: [:name],
                  using: {
                    tsearch: { prefix: true }
                  }
end
