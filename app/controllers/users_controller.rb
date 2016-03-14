class UsersController < ApplicationController

  def new
    @user = User.new
  end
  
    def create
    @user = User.new(user_params)
    if @user.save
      redirect_to @user, notice: "会員登録が完了しました"
    else
      render 'new'
    end
  end
  
end
