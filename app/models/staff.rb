class Staff < ApplicationRecord
    
    def create
    staff = Staff.new(member_id: params[:member_id], section_id: params[:section_id], join: "true")
    staff.save
    redirect_to("/calenders/#{params[:id]}/index")
    end
    
    
end
