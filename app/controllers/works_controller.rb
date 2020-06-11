class WorksController < ApplicationController
    before_action :set_current_user
 
  def set_current_user
    @current_user = User.find_by(id: session[:user_id])
  end
  
  
  def show
     @works = Work.find_by(id: params[:id])
     @members = Member.where(work_id: @works.id)
     @tasks = Task.where(wrok_id: @works.id)
  end
  
    
  def index
    @member = Member.where(user_id: @current_user.id)
    @charas = Chara.where(user_id: @current_user.id)
  end
  
  

  def list
   @works = Work.all
   @member = Member.all
   @progress = Progress.all
   @charas = Chara.all
   @sections = Section.all
   @timetable = Timetable.all
  end


  def new
  end
  
  def create
      @work = Work.new(work_name: params[:work_name],work_status: "祝！立ち上げ！！", work_ico: "sozai_icon_noimge1.jpg", work_top_image: "sozai_noimage.png")
      @work.save
      
      @members = Member.new(user_id: params[:id], work_id: @work.id, job: "企画者")
      @members.save

       now = Time.current
      deadline = now.since(7.days)
      @tasks = Task.new(task_title:"企画詳細を設定しよう！", user_id: @current_user.id, wrok_id: @work.id, chara_id: nil, deadline: deadline, task_link: "/works/#{@work.id}/edit", done: nil, work_name: @work.work_name, chara_name: nil)
      @tasks.save
      redirect_to("/works/#{@work.id}")
  end
  
  def edit
    @works = Work.find_by(id: params[:id])
    @members = Member.where(work_id: @works.id)
  end
  
  
  def update
     @works = Work.find_by(id: params[:id])
     @works.work_name = params[:work_name]
     
      if params[:work_ico]
        @works.work_ico = "#{params[:id]}_ico.jpg"
        work_ico = params[:work_ico]
        File.binwrite("public/#{@works.work_ico}", work_ico.read)
      end
      if params[:work_top_image]
        @works.work_top_image = "#{params[:id]}_top.jpg"
        work_top_image = params[:work_top_image]
        File.binwrite("public/#{@works.work_top_image}", work_top_image.read)
      end
     @works.save
    redirect_to("/works/#{params[:id]}")    

  end

  def destroy
    work = Work.find_by(id: params[:id])
    work.destroy
    redirect_to("/users/#{@current_user.id}")
  end

# ここまでcommon----------------------------------


  



  
end
