class SectionsController < ApplicationController

  before_action :set_current_user
 
  def set_current_user
    @current_user = User.find_by(id: session[:user_id])
  end
  
  def index
    @works = Work.find_by(id: params[:id])
    @sections = Section.where(work_id: params[:id])
  end
  
  def new
     @works = Work.find_by(id: params[:id])
  end
  
  def destroy
    @section = Section.find_by(id:params[:section_id])
    section_name = @section.section_name
    @section.destroy
     redirect_to("/sections/#{params[:id]}")
      flash[:notice] = "#{section_name}を削除しました。"
  end
    
end
