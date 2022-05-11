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
end