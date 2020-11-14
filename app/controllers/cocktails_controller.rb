class CocktailsController < ApplicationController
  def index
      @cocktails = Cocktail.all
  end

  def show
    if params[:name]
      @cocktail = Cocktail.where("name LIKE ?", "%#{params[:name]}%").first
    else
      @cocktail = Cocktail.find(params[:id])
    end
    @cocktail
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
    if @cocktail.save
      redirect_to cocktail_path(@cocktail.id)
    else
      render :new
    end
  end

  private

  def cocktail_params
    params.require(:cocktail).permit(:name, photos: [])
  end
end
