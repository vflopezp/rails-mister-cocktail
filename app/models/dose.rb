class Dose < ApplicationRecord
  belongs_to :ingredient
  belongs_to :cocktail

  validates :cocktail, presence: true, uniqueness: { scope: :ingredient }
  validates :description, :ingredient, presence: true
end
