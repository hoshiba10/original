class FavoritesController < ApplicationController
    before_action :logged_in_user
    
    def create
        p "========== By create ============"
        @item = Item.find(params[:favorite][:item_id])
        p "-------"
        p params[:favorite][:item_id]
        p "-------"
        current_user.favorite_item(@item)
    end
        
    def destroy
        p "-------"
        p params[:favorite]
        p "-------"
        p "============ By destroy ======================"
        @item = current_user.favorites.find(params[:favorite][:item_id])
        p "aaaaaaaaaa"
        p @item
        p "aaaaaaaaaa"
        current_user.unfavorite_item(@item)
    end
    
end
