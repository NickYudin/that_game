class Character < ApplicationRecord

	belongs_to :user
	has_one :ability_table, dependent: :destroy
	validates_presence_of :name, :level, :health, :experiense, :user_id, :char_class_id

end
