class InformationsController < ApplicationController
  
  def played
    if logged_in?
      @informations = Information.where("category = ?", "played").paginate(page: params[:page])
    end
  end
  
end
