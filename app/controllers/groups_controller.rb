class GroupsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  before_action :correct_user,   only: :destroy
  def new
  end
  
  def create
    @group = current_user.groups.buils(group_params)
    @group.image.attach(params[:group][:image])    
    if @group.save
      flash[:success] = "グループ作成完了!"
      redirect_to root_url
    else
      render 'static_pages/home'
    end
  end

  def destroy
    @group.destroy
    flash[:success] = "グループを削除しました！"
    redirect_to request.referrer || root_url
  end
  
  private

    def group_params
      params.require(:group).permit(:name, :image)
    end  
  
    def correct_user
      @group = current_user.groups.find_by(id: params[:id])
      redirect_to root_url if @group.nil?
    end
end
