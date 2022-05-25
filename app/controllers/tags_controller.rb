class TagsController < ApplicationController
  before_action :logged_in_user

  def create
    @info = Information.find(params[:information_id])
    @group = Group.find(params[:group_id])
    @group.tag(@info)
    redirect_to request.referer
    # respond_to do |format|
    #   format.html { redirect_to request.referer }
    #   format.js
    # end
  end

  def destroy
    @info = Information.find(Tag.find(params[:id]).information_id)
    @group = Group.find(params[:group_id])
    @group.untag(@info)
    redirect_to request.referer
    # respond_to do |format|
    #   format.html { redirect_to request.referer }
    #   format.js
    # end
  end
end
