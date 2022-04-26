class SelfIntroductionsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]

  def create
    @self_introduction = current_user.build_self_introduction(self_introduction_params)
    if @self_introduction.save
      flash[:success] = "自己紹介文作成完了!"
      redirect_to root_url
    else
      render 'static_pages/home'
    end
  end

  def destroy
  end

  private

    def self_introduction_params
      params.require(:self_introduction).permit(:content)
    end
end
