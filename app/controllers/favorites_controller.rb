class FavoritesController < ApplicationController
 
  def create
    f = Favorite.create(favorite_params)
    puts f.inspect
    redirect_to locations_path
  end

  def destroy
    Favorite.destroy params[:id]
    redirect_to lists_path
  end

end

private
  # Never trust parameters from the scary internet, only allow the white list through.
  def favorite_params
    params.require(:favorite).permit(
      :list_id, :location_id
    )
  end

  # require = requiring that there be a favorite key. give you hash nested in that key, which permits list_id and location_id in the hash.