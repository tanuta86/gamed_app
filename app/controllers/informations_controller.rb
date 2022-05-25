class InformationsController < ApplicationController
  before_action :admin_user,     only: [:create, :destroy]

  def index
    if logged_in?
      @params = params[:cate]
      if @params == "played" || "console" || "contact" || "style"
        @informations = Information.where("category = ?", @params).paginate(page: params[:page])
      end
    end
  end
  
  def show
    @information = Information.find(params[:id])
    @user = current_user
    case params[:mode]
    when "user"
      @informations = @information.users.paginate(page: params[:page])
    when "group"
      @informations = @information.groups.paginate(page: params[:page])
    end  
  end 

  def create
    @information = Information.new(information_params)
    if @information.save
      flash[:info] = "新タグ保存"
    end
    redirect_to root_url
  end
  
  def destroy
    Information.find(params[:id]).destroy
    flash[:success] = "削除しました"
    redirect_to request.referrer || root_url
  end

private

  def information_params
    params.permit(:category, :content)
  end
  
  def admin_user
    redirect_to(root_url) unless current_user.admin?
  end
end
