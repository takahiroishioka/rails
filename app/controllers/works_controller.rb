class WorksController < ApplicationController
    before_action :set_current_user
 
  def set_current_user
    @current_user = User.find_by(id: session[:user_id])
  end
  
  
  def home
     @works = Work.find_by(id: params[:id])
     @members = Member.where(work_id: @works.id)
  end
  

  def list
   @works = Work.all
   @member = Member.all
   @progress = Progress.all
   @charas = Chara.all
  end


  def create_form
  end
  
  def create
      @work = Work.new(work_name: params[:work_name],work_status: "祝！立ち上げ！！", work_ico: "sozai_icon_noimge1.jpg", work_top_image: "sozai_noimage.png")
      @work.save
      @members = Member.new(user_id: params[:id], work_id: @work.id, job: "企画者")
      @members.save
      redirect_to("/works/list")
  end


# ここまでcommon----------------------------------

  def chara
    @works = Work.find_by(id: params[:id])
    @charas = Chara.where(work_id: params[:id])
  end
  
  def chara_create_form
    @works = Work.find_by(id: params[:id])
    @charas = Chara.find_by(id: params[:chara_id])
  end

  def chara_create
      @chara = Chara.new(chara_name: params[:chara_name], chara_icon: "sozai_icon_noimge1.jpg", work_id: params[:work_id])
      @chara.save
    # redirect_to("/works/#{params[:work_id]}/chara")   
      redirect_to :controller => 'works',:action => 'chara_edit_form', :id => params[:work_id], :chara_id => @chara.id
  end

  def chara_edit_form
      @works = Work.find_by(id: params[:id])
      @charas = Chara.find_by(id: params[:chara_id])
  end
  
  def chara_edit
     @charas = Chara.find_by(id: params[:chara_id])
     @charas.chara_name = params[:chara_name]
     
      if params[:chara_icon]
        @charas.chara_icon = "#{params[:chara_id]}.jpg"
        chara_icon = params[:chara_icon]
        File.binwrite("public/chara_icon/#{@charas.chara_icon}", chara_icon.read)
      end
     @charas.save
    redirect_to("/works/#{params[:work_id]}/chara")    
  end
  
  def chara_destroy
    @charas = chara.find_by(id:params[:chara_id])
    @charas.destroy
    redirect_to("/works/#{params[:work_id]}/chara")
  end


# ここまでchara--------------------------------


  def invite_member_form
        @works = Work.find_by(id: params[:id])
        @members = Member.find_by(work_id: params[:id])
        @users = User.where(id: @members.user_id)
  end
  
  def invite
      @works = Work.find_by(work_name: params[:work_name])
      @users = User.find_by(user_twitter_id: params[:user_twitter_id])
      @members = Member.new(user_id: @users.id, work_id: @works.id, job: params[:job])
      @members.save
      redirect_to("/works/list")    
  end
  
  def join_request_form
      @works = Work.find_by(id: params[:id])
      @users = User.all
  end
  
  def join_request
      @works = Work.find_by(id: params[:id])
      @users = User.find_by(id: params[:user_id])
      @chara = Chara.find_by(id: params[:chara_id])
      now = Time.current
      deadline = now.since(7.days)
      
      @tasks = Task.new(task_title:"#{@works.work_name}への出演依頼", user_id:params[:user_id], wrok_id: params[:id], work_name:@works.work_name, chara_id:params[:chara_id], chara_name: @chara.chara_name, deadline: deadline,task_link:"re_join_request_form") 
      @tasks.save
      
      @chara.cast_id = 0
      @chara.save
      
      redirect_to("/tasks/list")
  end  

# ここまでmember-----------------------------------------
  
  def script
    @works = Work.find_by(id: params[:id])
    @scripts = Section.where(work_id: params[:id])
  end

  def create_section_form
     @works = Work.find_by(id: params[:id])
  end
  
  def const_section
    @works = Work.find_by(id: params[:id])
     i = params[:start_section].to_i
     last_section = params[:last_section].to_i
    while i <= last_section
    
    @sections = Section.new(section_name: "第#{i}話" ,work_id: params[:id])
    i += 1
    @sections.save
    end
    redirect_to("/works/#{params[:id]}/script")
  end
  
  def destroy_section
    @section = Section.find_by(id:params[:section_id])
    section_name = @section.section_name
    @section.destroy
     redirect_to("/works/#{params[:id]}/script")
      flash[:notice] = "#{section_name}を削除しました。"
  end
  
end
