class DosesController < ApplicationController
  def new
    @cocktail = Cocktail.find(params[:cocktail_id]) # cocktail_id sors du params
    @dose = Dose.new
  end

  def create
    @dose = Dose.new(dose_params)
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose.cocktail = @cocktail # le model dose a un belong to sur cocktail donc il existe la methode .cocktail sur une isntance de dose
    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  def destroy
    @dose = Dose.find(params[:id])
    @dose.destroy

    redirect_to cocktail_path(@dose.cocktail)
  end

  private

  def dose_params
    params.require(:dose).permit(:description, :ingredient_id, :cocktail_id) # si on créé la table dose elle a une description, un ingredient_id et un cocktail_id
  end
end
