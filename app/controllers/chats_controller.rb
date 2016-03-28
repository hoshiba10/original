class ChatsController < ApplicationController
    before_action :logged_in_user
    before_action :check_user, only: [:index]
    
    def index
        if @item.sold_out_flg != true
            @give_user = User.find(@item.user.id)
            @receive_user = User.find(@item.accept_user_id)
            @chat = Chat.new
            @chats = Chat.where(item_id: params[:id])
        else 
            redirect_to detail_item_path
        end
    end
    

    def create
        @item = Item.find(chat_params[:item_id])
        @chat = Chat.new(chat_params)
        @chat.speaker_id = current_user.id
        @chat.save
        redirect_to action: :index, id: @item.id
    end
    
    def show
        @chats = Chat.all
    end
    
    def complete
        item = Item.find(params[:id])
        item.sold_out_flg = true
        item.save
        redirect_to item_path 
    end
    
    private
    def chat_params
        params.require(:chat).permit(:id, :chat_content, :item_id)
    end
    
    def check_user
        @item = Item.find(params[:id])
        if @item.accept_user_id.nil?
            @item.accept_user_id = params[:accept_id]
            @item.save
        end
        if @item.accept_user_id == current_user.id || @item.user.id == current_user.id
        else
            redirect_to :controller => 'items', :action => 'detail'
        end
    end
end
