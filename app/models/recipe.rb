class Recipe < ApplicationRecord
  has_one_attached :photo
  after_save :set_content, if: -> { saved_change_to_name? || saved_change_to_ingredients? }

  def set_content
    RecipeContentJob.perform_later(self)
  end
end
