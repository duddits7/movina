class Person < ApplicationRecord
  has_many :awards
  has_many :movies, through: :casts
  has_many :trivia
end
