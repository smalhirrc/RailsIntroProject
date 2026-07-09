class District < ApplicationRecord
    has_many :parks

    validates :district_name, presence: true, uniqueness: true
end
