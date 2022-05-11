class InformationsController < ApplicationController

  def category
    if logged_in?
      @params = params[:cate]
        
      case @params
      when "played"  
        @informations = Information.where("category = ?", @params).paginate(page: params[:page]) 
        
      when "console"
        @informations = Information.where("category = ?", @params).paginate(page: params[:page]) 

      when "contact"
        @informations = Information.where("category = ?", @params).paginate(page: params[:page]) 
        
      else
        redirect_to root_url
        
      end
    end
  end
  

end
