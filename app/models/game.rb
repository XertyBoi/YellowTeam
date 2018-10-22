class Game < ApplicationRecord
  has_one :board
  has_many :user
end
