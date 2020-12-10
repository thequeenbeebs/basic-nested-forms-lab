class RecipesController < ApplicationController
  def show
    @recipe = Recipe.find(params[:id])
  end

  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
    @recipe.ingredients.build(id: 0)
    @recipe.ingredients.build(id: 1)
  end

  def create
    @recipe = Recipe.create(recipe_params)
  end

  private

  def recipe_params
    params.require(:recipe).permit(
      :title, 
      ingredients_attributes: [
        :name,
        :quantity
      ]
    )
  end

end
