require "open-uri"

class Recipe < ApplicationRecord
  has_one_attached :photo
  after_save :set_content, if: -> { saved_change_to_name? || saved_change_to_ingredients? }
  after_save :set_photo, if: -> { saved_change_to_name? || saved_change_to_ingredients? }

  private

  def set_content
    # Delegate the task to a background job
    GenerateRecipeContentJob.perform_later(self)
  end

  def set_photo
    AttachPhotoToRecipeJob.perform_later(self)
  end
end
