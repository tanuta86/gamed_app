class InformationsController < ApplicationController

  def category
    if logged_in?
        @params = params[:cate]
        if @params == "played"
          @informations = Information.where("category = ?", @params).paginate(page: params[:page]) 
        
        elsif @params == "console"
          @informations = Information.where("category = ?", @params).paginate(page: params[:page]) 

        elsif @params == "contact"
          @informations = Information.where("category = ?", @params).paginate(page: params[:page]) 
        end
    end
  end
  
end
