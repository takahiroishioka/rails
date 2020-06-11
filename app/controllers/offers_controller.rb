class OffersController < ApplicationController
    
    #join_requestによって生成されたTaskテーブルの内容を書き換える
#ダッシュボード(user#index)に表示

  before_action :set_current_user
 
  def set_current_user
    @current_user = User.find_by(id: session[:user_id])
  end
    
    
  def edit
    @tasks = Task.find_by(id: params[:id])
    @works = Work.find_by(id: @tasks.wrok_id)
    @chara = Chara.find_by(id: @tasks.chara_id)
  end
  
  def update
    @chara = Chara.find_by(id: params[:chara_id])
    @chara.cast_id = params[:user_id]
    @chara.save
    
    @tasks = Task.find_by(id: params[:task_id])
    @tasks.destroy
    
    @members = Member.new(user_id: params[:user_id],work_id: params[:work_id], job: "演者",chara_id:@chara.id)
    @members.save
    
    redirect_to("/users/#{params[:user_id]}")  
  end

  def new
      @works = Work.find_by(id: params[:id])
      @users = User.all
  end
  
  def create
      @works = Work.find_by(id: params[:id])
      @users = User.find_by(id: params[:user_id])
      @chara = Chara.find_by(id: params[:chara_id])
      now = Time.current
      deadline = now.since(7.days)
      
      @tasks = Task.new(task_title:"#{@works.work_name}への出演依頼", user_id:params[:user_id], wrok_id: params[:id], work_name:@works.work_name, chara_id:params[:chara_id], chara_name: @chara.chara_name, deadline: deadline,task_link:nil) 
      @tasks.save
      @tasks.task_link = "/offers/#{@tasks.id}/edit"
      @tasks.save
    
      
      @chara.cast_id = 0
      @chara.save
      
      redirect_to("/works/#{@works.id}")
  end  



  
  def destroy
      #出演出来ないときの為の処理
  end
  
end
