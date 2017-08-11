class CocktailsController < ApplicationController
before_action :set_cocktail, only: [:show, :edit, :update, :destroy]
  def index
    @cocktails = Cocktail.all
  end

  def new
    @cocktail = Cocktail.new
  end

  def create

    @cocktail = Cocktail.new(cocktail_params)
    if params[:photo] == nil
      params[:photo] = "hhttp://aminbhs.fr/img/logo-ab.png"
    end
    @cocktail.save
    redirect_to cocktail_path(@cocktail)
  end


  def show
  end

  def update
    @cocktail.update(cocktail_params)
    redirect_to cocktail_path(@cocktail)
  end

  def edit
  end

  def destroy
    @cocktail.destroy
    redirect_to cocktails_path

  end

private
  def set_cocktail
    @cocktail = Cocktail.find(params[:id])

  end

  def cocktail_params
    params.require(:cocktail).permit(:name, :photo, :photo_cache, :photo_url)
  end
end
