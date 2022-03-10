class Race < ApplicationRecord
  has_many :users
  has_one :race_increase
end
