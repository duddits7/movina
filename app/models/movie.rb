class Movie < ActiveRecord::Base
  resourcify
  has_many :covers
  has_many :media
  has_many :casts
  has_many :awards
  has_and_belongs_to_many :genres
  has_and_belongs_to_many :countries
  belongs_to :mpaa
  accepts_nested_attributes_for :genres
  accepts_nested_attributes_for :countries
  accepts_nested_attributes_for :covers, :allow_destroy => true

  scope :approved, -> { where(approved: true) }
  default_scope -> { order(post_date: :desc) }

  validates :title, presence: true, length: { in: 1..80 }
  validates :description, presence: true
  validates :prod_date, presence: true

  scope :with_country_id, ->(country_id) { joins(:countries).where(countries: {id: [*country_id] } ) }
  scope :with_genre_id, ->(genre_id) { joins(:genres).where(genres: {id: [*genre_id] } ) }
  scope :with_mpaa_id, ->(mpaa_id) { joins(:mpaas).where(mpaas: {id: [*mpaa_id] } ) }

  scope :sorted_by, lambda { |sort_key|

  }

  def self.options_for_sorted_by
    [
      ['Name (a-z)', 'name_asc'],
      ['Registration date (newest first)', 'post_date_desc'],
      ['Registration date (oldest first)', 'post_date_asc'],
      ['Country (a-z)', 'country_name_asc']
    ]
  end

  max_paginates_per 50
end
