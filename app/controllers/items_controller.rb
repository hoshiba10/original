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
    
    def detail
        @item = Item.find(params[:id])
        if @item.sold_out_flg != true
            if !(@item.accept_user_id.nil?)
                if @item.user.id == current_user.id || @item.accept_user_id == current_user.id
                    redirect_to chat_path
                end
            end
        end
    end
    
    def destroy
        @item = Item.find(params[:id])
        @item.destroy
        redirect_to user_my_item_path(current_user) , notice: 'ものを削除しました'
    end
    
    private
    def item_params
        params.require(:item).permit(:title, :image, :content, :image_cache, :user_id)
    end
    
end
