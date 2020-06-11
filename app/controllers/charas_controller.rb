#worksに従属

class CharasController < ApplicationController
    
  before_action :set_current_user
 
  def set_current_user
    @current_user = User.find_by(id: session[:user_id])
  end


  def index
    @works = Work.find_by(id: params[:id])
    @charas = Chara.where(work_id: params[:id])
  end
  
  def new
    @works = Work.find_by(id: params[:id])
    @charas = Chara.find_by(id: params[:chara_id])
  end
  
  def create
      @chara = Chara.new(chara_name: params[:chara_name], chara_icon: "sozai_icon_noimge1.jpg", work_id: params[:id])
      @chara.save
      redirect_to :controller => 'charas',:action => 'edit', :id => params[:id], :chara_id => @chara.id
  end
  
  def edit
      @works = Work.find_by(id: params[:id])
      @charas = Chara.find_by(id: params[:chara_id])
  end
  
    
  def update
     @charas = Chara.find_by(id: params[:chara_id])
     @charas.chara_name = params[:chara_name]
     
      if params[:chara_icon]
        @charas.chara_icon = "#{params[:chara_id]}.jpg"
        chara_icon = params[:chara_icon]
        File.binwrite("public/chara_icon/#{@charas.chara_icon}", chara_icon.read)
      end
     @charas.save
    redirect_to("/charas/#{params[:work_id]}")    
  end
  
  def destroy
    @charas = Chara.find_by(id:params[:chara_id])
    @charas.destroy
    redirect_to("/charas/#{params[:work_id]}")
  end

end
