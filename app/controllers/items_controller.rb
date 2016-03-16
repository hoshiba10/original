class ItemsController < ApplicationController
    def new
        @item = Item.new
    end
    
    def create
        @item = Item.new(item_params)
        if params[:back]
            render 'new'
        elsif @item.save
            redirect_to '/users/new', notice: 'ものを登録しました.'
        else
            render 'new'
        end
    end
    
    def confirm
        @item = Item.new(item_params)
        render :new if @item.invalid?   
    end
    
    
    def item_params
        params.require(:item).permit(:title, :image, :content)
    end
    
end
