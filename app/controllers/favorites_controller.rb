class FavoritesController < ApplicationController
  before_action :logged_in_user

  def create

    @group = Group.find(params[:group_id])
    @user = current_user
    @user.favorite(@group)
   
    redirect_to request.referer
    # respond_to do |format|
    #   format.html { redirect_to request.referer }
    #   format.js
    # end
  end

  def destroy

    @group = Group.find(Favorite.find_by(group_id: params[:group_id]).group_id)
    @user = current_user
    @user.not_favorite(@group)
    redirect_to request.referer
    # respond_to do |format|
    #   format.html { redirect_to request.referer }
    #   format.js
    # end
  end
  
end

