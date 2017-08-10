class CocktailsController < ApplicationController

  def index
    @cocktails = Cocktail.All
  end

  def new
  end
end
