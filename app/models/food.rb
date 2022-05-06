class Food < ApplicationRecord
  belongs_to :users
  hashas_many :recipe_foods
  has_many :recipes, through: :recipe_foods
end