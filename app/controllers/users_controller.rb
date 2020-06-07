class UsersController < ApplicationController
  before_action :set_current_user
 
  def set_current_user
    @current_user = User.find_by(id: session[:user_id])
  end
  
  def home
     @progress = Progress.all
     @tasks = Task.where(user_id: params[:id])
    
  end
  
  def works
    @member = Member.where(user_id: @current_user.id)
    @charas = Chara.where(user_id: @current_user.id)
  end
  
  def list
    @users = User.all
  end
  
  def login_form
  end
  
  def login
    @users = User.find_by(user_twitter_id: params[:user_twitter_id],password_digest: params[:password])
    
    if @users
      session[:user_id] = @users.id
      redirect_to("/users/#{@users.id}")
      flash[:notice] = "ログイン成功！"
    else
      redirect_to("/users/login_form")
      flash[:notice] = "ログイン情報を再確認してください"
    end
  end
  
  def logout
    session[:user_id] = nil
    redirect_to("/")
  end
  
end
