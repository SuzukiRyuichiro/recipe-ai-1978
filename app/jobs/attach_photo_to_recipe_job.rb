class AttachPhotoToRecipeJob < ApplicationJob
  queue_as :default

  def perform(recipe)
    puts "generating photo"
    # Get a photo from pollinations ai
    # save that as an active storage attachments
    file = URI.parse("https://image.pollinations.ai/prompt/#{recipe.name.gsub(/[,\s]/, '-')}-with-ingredients-#{recipe.ingredients.gsub(/[,\s]/, '-')}?nologo=true&height=512&width=512").open
    recipe.photo.attach(io: file, filename: "#{recipe.name}.jpg", content_type: "image/jpeg")
    recipe.save
    puts "done generating photo"
  end
end
