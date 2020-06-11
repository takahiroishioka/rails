class UsersController < ApplicationController
  before_action :set_current_user
 
  def set_current_user
    @current_user = User.find_by(id: session[:user_id])
  end
  
  def index
     @progress = Progress.all
     @tasks = Task.where(user_id: params[:id])
  end
  
  def new
  end
  
  def create
    @user = User.new(user_name: params[:user_name], user_twitter_id: params[:user_twitter_id], password: params[:password], password_confirmation: params[:password_confirmation],user_icon: "free_ico_01.jpg")
    @user.save
    session[:user_id] = @user.id
    redirect_to("/users/#{@user.id}")
  end
  
  def works
    @member = Member.where(user_id: @current_user.id)
    @charas = Chara.where(user_id: @current_user.id)
  end
  
  def list
    @users = User.all
  end
  
  def edit
  end
  
  def update
    user =User.find_by(id: params[:id])
    user.user_name = params[:user_name]
    
    if params[:user_icon]
    user.user_icon = "#{params[:id]}.jpg"
    user_icon = params[:user_icon]
    File.binwrite("public/#{user.user_icon}", user_icon.read)
    end
    user.save
    redirect_to("/users/#{params[:id]}")
  end
  
  def destroy
    user =User.find_by(id: params[:id])
    user.destroy
    redirect_to("/")
  end
  
  def login_form
    if @current_user
      redirect_to("/users/#{@current_user.id}")
    end
  end
  
  def login
    user = User.find_by(user_twitter_id: params[:user_twitter_id])
    if user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to("/users/#{user.id}")
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
