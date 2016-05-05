class SessionsController < ApplicationController
  def new
  end
  
  def create
    @user = User.find_by(email: params[:session][:email].downcase)
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      flash[:info] = "ようそこ、#{@user.name}さん"
      redirect_to '/items/show'
    else
      flash[:danger] = 'invalid email/password combination'
      render 'new'
    end
  end
  
  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
  
  def edit
  end
  
  def update
    @user = User.find_by(email: params[:session][:email].downcase)
    if @user.present?
      flash[:info] = "パスワードを送信しました。早急にパスワードを変更しておきましょう。"
      redirect_to forget_path
    else
      flash[:danger] = "メールアドレスと一致しませんでした。"
      redirect_to root_path
    end
  end
  
end
