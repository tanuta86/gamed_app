class StaticPagesController < ApplicationController
  
  def home
    @self_introduction = current_user.build_self_introduction if logged_in?
  end


  def contact
  end
end
