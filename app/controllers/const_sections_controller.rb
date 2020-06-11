class ConstSectionsController < ApplicationController

    
  before_action :set_current_user
 
  def set_current_user
    @current_user = User.find_by(id: session[:user_id])
  end

 def create
    @works = Work.find_by(id: params[:id])
     i = params[:start_section].to_i
     last_section = params[:last_section].to_i
    while i <= last_section
    
    @sections = Section.new(section_name: "第#{i}話" ,work_id: params[:id])
    i += 1
    @sections.save
    
    now = Time.current
    deadline_rec = now.since(30.days)
    deadline_mix = now.since(60.days)
    deadline_release = now.since(90.days)
    timetable = Timetable.new(title:"収録", deadline: deadline_rec, work_id: @works.id, section_id: @sections.id)
    timetable.save
    timetable = Timetable.new(title:"編集", deadline: deadline_mix, work_id: @works.id, section_id: @sections.id)
    timetable.save
    timetable = Timetable.new(title:"公開", deadline: deadline_release, work_id: @works.id, section_id: @sections.id)
    timetable.save
    end
    redirect_to("/sections/#{params[:id]}/")
 end

end
