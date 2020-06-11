class CalendersController < ApplicationController
  before_action :set_current_user
 
  def set_current_user
    @current_user = User.find_by(id: session[:user_id])
  end
  
  def index
    @works = Work.find_by(id: params[:id])
    @sections = Section.where(work_id: params[:id])
  end
  
  def create
    deadline = params[:deadline]
    date = deadline.to_datetime
    timetable = Timetable.new(title: params[:new_item], deadline: date, work_id: params[:id], section_id: params[:section_id])
    timetable.save
    redirect_to("/calenders/#{@works.id}/index")
  end

  def edit
    @works = Work.find_by(id: params[:id])
    @sections = Section.find_by(id: params[:section_id])
    @members = Member.where(work_id: @works.id)
  end

  def update
    @works = Work.find_by(id: params[:id])
    deadline = params[:deadline]
    date = deadline.to_datetime
    @timetable = Timetable.find_by(id: params[:timetable_id])
    @timetable.deadline = date
    @timetable.save
    redirect_to("/calenders/#{@works.id}/index")
    
  end

  def destroy
    @works = Work.find_by(id: params[:id])
    @timetable = Timetable.find_by(id: params[:timetable_id])
    @timetable.destroy
    redirect_to("/calenders/#{@works.id}/index")
  end
end
