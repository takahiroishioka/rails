class MembersController < ApplicationController
    
  before_action :set_current_user
 
  def set_current_user
    @current_user = User.find_by(id: session[:user_id])
  end
  
  def new
      @works = Work.find_by(id: params[:id])
  end
  
  def create
      @works = Work.find_by(id: params[:id])
      @users = User.find_by(user_twitter_id: params[:user_twitter_id])
      @member = Member.new(user_id: @users.id, work_id: params[:id], job: params[:job])
      @member.save
      redirect_to("/works/#{params[:id]}")
  end
end
