class StaticPagesController < ApplicationController
  
  def home
    if logged_in?
      @self_introduction  = current_user.self_introduction
      @feed_items = current_user.feed.paginate(page: params[:page])
      @users = User.paginate(page: params[:page])
    end
  end



  def contact
  end
end
