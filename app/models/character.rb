class Character < ApplicationRecord

	belongs_to :user
	validates_presence_of :name, :power, :health, :experiense, :user_id

end
