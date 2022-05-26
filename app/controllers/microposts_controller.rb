class MicropostsController < ApplicationController
  
  before_action :logged_in_user, only: [:create, :destroy]
  before_action :correct_user,   only: :destroy  

  def create
    @user = current_user
    @micropost = @user.microposts.build(micropost_params)
    @micropost.image.attach(params[:image])    
    if @micropost.save
      flash[:success] = "Micropost created!"
    end
    redirect_to request.referrer || root_url    
  end

  def destroy
    @micropost.destroy
    flash[:success] = "削除しました！"
    redirect_to request.referrer || root_url
  end

  
  
private

  def micropost_params
    params.permit(:content, :user_id, :group_id, :image)
  end
  
  def correct_user
    @micropost = current_user.microposts.find_by(id: params[:id])
    redirect_to root_url if @micropost.nil?
  end
end
