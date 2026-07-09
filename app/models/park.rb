class Park < ApplicationRecord
  belongs_to :district
  has_many :assets

  validates :park_id, presence: true, uniqueness: true
  validates :park_name, presence: true
  validates :park_category, presence: true
end
