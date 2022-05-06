class Recipe < ApplicationRecord
  belongs_to :users
  has_many :recipe_foods
  has_many :foods, through: :recipe_foods
end