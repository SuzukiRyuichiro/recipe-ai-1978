class RecipeContentJob < ApplicationJob
  queue_as :default

  def perform(recipe)
    chat = RubyLLM.chat
    chaptgpt_response = chat.ask("Give me a simple recipe for #{recipe.name} with the ingredients #{recipe.ingredients}. Give me only the text of the recipe, without any of your own answer like 'Here is a simple recipe'.")
    new_content = chaptgpt_response.content

    recipe.update(content: new_content)
  end
end
