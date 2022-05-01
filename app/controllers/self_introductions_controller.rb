class SelfIntroductionsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  before_action :correct_user,   only: :destroy


  def create
    @self_introduction = current_user.build_self_introduction(self_introduction_params)
    @self_introduction.image.attach(params[:self_introduction][:image]) unless @self_introduction.image.nil
    if @self_introduction.save
      flash[:success] = "自己紹介文作成完了!"
      redirect_to root_url
    else
      @feed_items = current_user.feed.paginate(page: params[:page])
      render 'static_pages/home'
    end
  end

# 変更
  def destroy
    @self_introduction.destroy
    flash[:success] = "自己紹介文を削除しました！"
    redirect_to request.referrer || root_url
  end



  private

    def self_introduction_params
      params.permit(:content, :image)
    end

    
    def correct_user
      # @self_introduction = current_user.self_introduction.find(id: params[:id])
      # redirect_to root_url if @self_introduction.nil?
      # todo
      if  current_user.self_introduction.id == params[:id]
        @self_introduction = current_user.self_introduction
        
      else
        @self_introduction =nil
      end
      
      redirect_to root_url if @self_introduction.nil?
      
      
    end
    
end
