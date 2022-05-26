class SelfIntroductionsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  before_action :correct_user,   only: :destroy

  def create
    @self_introduction = current_user.build_self_introduction(self_introduction_params)
    # if @self_introduction.image.present?
    #   @self_introduction.image.attach(params[:self_introduction][:image]) 
    # end
    if @self_introduction.save
      flash[:success] = "自己紹介文作成完了!"
      #OK!!
      redirect_to root_url
      # redirect_to  user_path(@self_introduction.user)
    else
      # @feed_items = current_user.feed.paginate(page: params[:page])
      render 'static_pages/home'
    end
  end
  
  def edit
    @self_introduction = current_user.self_introduction
  end

  def update
    @self_introduction = current_user.self_introduction
    if @self_introduction.update(self_introduction_update_params)
      flash[:success] = "更新完了"
    end
    redirect_to root_url     
  end

  def destroy
    @self_introduction.destroy
    flash[:success] = "自己紹介文を削除しました！"
    redirect_to request.referrer || root_url
  end

private

  def self_introduction_params
    params.permit(:content)
  end
  
  def self_introduction_update_params
    params.require(:self_introduction).permit(:content)
  end  

  def correct_user
     # todo
    # @self_introduction = current_user.self_introduction.find(id: params[:id])
    # has_oneにfindが使えない？
    # redirect_to root_url if @self_introduction.nil?
    # has_oneにfindが使えない？
    # redirect_to root_url if @self_introduction.nil?
    if  current_user.self_introduction && current_user.self_introduction.id.to_s == params[:id]
      @self_introduction = current_user.self_introduction
    else
      redirect_to root_url if @self_introduction.nil?
    end
  end
end
