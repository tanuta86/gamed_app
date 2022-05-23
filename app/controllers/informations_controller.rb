class InformationsController < ApplicationController

  def category
    if logged_in?
      @params = params[:cate]
      if @params == "played" || "console" || "contact" || "style"
        @informations = Information.where("category = ?", @params).paginate(page: params[:page])
      end
    end
  end

  
end
