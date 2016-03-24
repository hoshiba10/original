class ChatsController < ApplicationController
    before_action :logged_in_user
    before_action :check_user, only: [:index]
    
    def index
        @chat = Chat.new
        @chats = Chat.all
    end
    

    def create
        @item = Item.find(chat_params[:item_id])
        @chat = Chat.new(chat_params)
        @chat.save
        redirect_to action: :index, id: @item.id
    end
    
    def show
        @chats = Chat.all
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
