class StaticPagesController < ApplicationController
  
  def home
    if logged_in?
      @self_introduction  = current_user.self_introduction
      @feed_items = current_user.feed.paginate(page: params[:page])
      @group = current_user.groups.build if logged_in?
      @user = current_user
      @groups2 = @user.groups
      group_ids = []
      @user.favorites.each{ |favorite_object| group_ids.push(favorite_object.group_id) }
      @groups3 = []
      group_ids.each{ |id| @groups3 << Group.find(id)}
    end
  end

  def contact
  end
end
