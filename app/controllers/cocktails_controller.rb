class CocktailsController < ApplicationController
  def index
    if params[:name]
      @cocktails = Cocktail.where("name LIKE ?", "%#{params[:name]}%")
    else
      @cocktails = Cocktail.all
    end
    @cocktails
  end

  def show
    @cocktail = Cocktail.find(params[:id])
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
    params.require(:cocktail).permit(:name)
  end
end
