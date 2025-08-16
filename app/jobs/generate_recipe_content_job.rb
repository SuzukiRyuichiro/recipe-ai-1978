class GenerateRecipeContentJob < ApplicationJob
  queue_as :default

  # Argument is an instance of Recipe
  def perform(recipe)
    puts "generating content"
    # Make a request to ChatGPT to generate the content of the recipe based on name and ingredients of the food
    chat = RubyLLM.chat
    response = chat.ask("Write me a couple of sentences on how to make #{recipe.name} with ingredients #{recipe.ingredients}")
    content = response.content
    # Save the response to the recipe
    recipe.update(content: content)
    puts "done generating content"
  end
end
