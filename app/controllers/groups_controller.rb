class GroupsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy, :index, :edit, :update]
  before_action :correct_user,   only: [:destroy, :edit, :update]
 
  def new
  end
  
  def index
    @groups = Group.paginate(page: params[:page])
    @user = current_user
  end  
  
  def show
    @group = Group.find(params[:id])
    @user = @group.user
    @microposts = @group.microposts.paginate(page: params[:page])
    if logged_in?
      @params = params[:cate]
        
      if @params == "played" || "console" || "contact" || "style"   
        @informations = Information.where("category = ?", @params).paginate(page: params[:page]) 
        @groups = @informations
      end
    else
      redirect_to root_url      
    end
  end    
    

  def create
    @group = current_user.groups.build(group_params)
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
  
  def update
    @group = Group.find(params[:id])
    @group.update(group_params)
    redirect_to request.referrer || root_url
  end
  
private

  def group_params
    params.require(:group).permit(:name, :image, :explanation)
  end  

  def correct_user
    @group = current_user.groups.find_by(id: params[:id])
    redirect_to root_url if @group.nil?
  end
end
