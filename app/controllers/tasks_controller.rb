class TasksController < ApplicationController
  before_action :set_current_user
 
  def set_current_user
    @current_user = User.find_by(id: session[:user_id])
  end
  
  def home
  end
  
  def list
    @tasks = Task.all
  end
  
  def re_join_request_form
    @tasks = Task.find_by(id: params[:id])
    @works = Work.find_by(id: @tasks.wrok_id)
    @chara = Chara.find_by(id: @tasks.chara_id)
  end
  
  def re_join_request
    @chara = Chara.find_by(id: params[:chara_id])
    @chara.cast_id = params[:user_id]
    @chara.save
    
    @tasks = Task.find_by(id: params[:task_id])
    @tasks.destroy
    
    @members = Member.new(user_id: params[:user_id],work_id: params[:work_id], job: "演者")
    @members.save
    
    redirect_to("/users/#{params[:user_id]}")  
    
    
  end
  
  
end
