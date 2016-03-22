class ItemsController < ApplicationController
    def new
        @item = Item.new
    end
    
    def create
        @item = current_user.items.build(item_params)
        if params[:back]
            render 'new'
        elsif @item.save
            redirect_to '/users/new', notice: 'ものを登録しました.'
        else
            render 'new'
        end
    end
    
    def confirm
        @item = current_user.items.build(item_params)
        render :new if @item.invalid?   
    end
    
    def show
        @items = Item.all
    end
    
    
    def item_params
        params.require(:item).permit(:title, :image, :content, :image_cache, :user_id)
    end
    
end
