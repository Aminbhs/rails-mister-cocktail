class IngredientsController < ApplicationController
class CocktailsController < ApplicationController
before_action :set_ingredient, only: [:show]
  def index
    @ingredients = Ingredient.all
  end

  def show
  end

private
  def set_cocktail
    @ingredient = Ingredient.find(params[:id])

  end

  def ingredient_params
    params.require(:ingredient).permit(:ingredients_path)
  end
end

end
