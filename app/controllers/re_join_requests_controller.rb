#join_requestによって生成されたTaskテーブルの内容を書き換える
#ダッシュボード(user#index)に表示

class ReJoinRequestsController < ApplicationController
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
  
  def destroy
      #出演出来ないときの為の処理
  end
  
end
