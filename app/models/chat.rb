class Chat < ApplicationRecord
  has_many :messages
  broadcasts
end
