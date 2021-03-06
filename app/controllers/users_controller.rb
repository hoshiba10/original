class UsersController < ApplicationController
  before_action :create_user, only: [:show, :edit, :update, :favorite]

  def new
    @user = User.new
  end
  
    def create
    @user = User.new(user_params)
    if @user.save
      PostMailer.post_email(@user).deliver
      flash[:success] = "会員登録が完了しました"
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      render 'new'
    end
  end
  
  def show
  end
  
  def edit
  end
  
  def update
    if params[:user][:password] != params[:user][:password_confirmation]
      flash[:danger] = "パスワードが一致していません"
      redirect_to edit_user_path(current_user)
    else
      image = params[:user].presence || nil
      if image != nil
          if @user.update(user_params)
            flash[:info] = "プロフィールを変更しました"
          end
          redirect_to profile_user_path(current_user)
      end
    end
  end
  
  def profile
    @user = User.find(current_user.id)
  end
  
  def favorite
    @favorite_items = @user.favorited_items
  end
  
  def my_item
    @user = User.find(params[:user_id])
    @items = @user.items
  end
  
  private 
  def user_params
    params.require(:user).permit(:name, :email, :address, :password, :password_confirmation, :image)
  end
  
  def create_user
    @user = User.find(current_user.id)
  end
end
