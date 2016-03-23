class FavoritesController < ApplicationController
    before_action :logged_in_user
    
    def create
        @item = Item.find(params[:favorite][:item_id])
        current_user.favorite_item(@item)
    end
        
    def destroy
        @item = Item.find(params[:favorite][:item_id])
        @item_fav = current_user.favorites.find_by(item_id: params[:favorite][:item_id])
        current_user.unfavorite_item(@item_fav)
    end

end
