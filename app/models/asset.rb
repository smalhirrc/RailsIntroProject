class Asset < ApplicationRecord
  belongs_to :park

  validates :asset_id, presence: true, uniqueness: true
  validates :asset_class, presence: true
  validates :asset_type, presence: true
end
