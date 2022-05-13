class HaveInformationsController < ApplicationController
  before_action :logged_in_user

  def create
    @info = Information.find(params[:information_id])
    current_user.have(@info)
    redirect_to request.referer
    # respond_to do |format|
    #   format.html { redirect_to request.referer }
    #   format.js
    # end
  end

  def destroy

    @info = Information.find(HaveInformation.find(params[:id]).information_id)
    current_user.unhave(@info)
    redirect_to request.referer
    # respond_to do |format|
    #   format.html { redirect_to request.referer }
    #   format.js
    # end
  end
  
  def edit
      @info = Information.find(params[:id])
      case params[:key]
      when "register"
        current_users_have_information(@info).update(recently: true) unless recently_MAX? 
      when "Remove"  
        current_users_have_information(@info).update(recently: false)     
      end
      
    redirect_to request.referrer || root_url
  end
  
  # 現在のユーザーとinformationのhave_informationオブジェクトを返す
  def current_users_have_information(information)
    HaveInformation.find_by(user_id: (current_user.id),information_id: (information.id))  
  end
  
  # 現在のユーザーのrecentlyがMAXならTrueを返す
  def recently_MAX? 
    current_user.informations.where("recently = ?", true).count == 10 
  end
  
end