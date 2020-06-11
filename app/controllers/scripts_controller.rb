class ScriptsController < ApplicationController
    
    def new
        @script = Script.new
    end
    
    def create
        @script = Script.create params.require(:script).permit(:content, :pdf)
        redirect_to @script
    end

    def show
        @script = Script.find(params[:id])
    end
    
    def edit
        @script = Script.find(params[:id])
    end
    
    def updated
        @script = Script.find(params[:id])
        @script.update params.require(:script).permit(:content, :pdf)
        redirect_to @script
    end
end
