class StaticPagesController < ApplicationController
  
  def home
    if logged_in?
      @self_introduction  = current_user.self_introduction
      @feed_items = current_user.feed.paginate(page: params[:page])
      @group = current_user.groups.build if logged_in?
    end
  end



  def contact
  end
end
