class QalistsController < ApplicationController
  before_action :logged_in_user, only: [:create]

  def create
    @qalist = current_user.qalists.build(qalist_params)
    if @qalist.save
      flash[:success] = "Q&Alist created!"
      redirect_to root_url
    else
      render 'static_pages/home'
    end
  end
  
def show
    @qalist = current_user.qalists.find_by(id: params[:id])
    if @qalist.nil?
      @qalist = Qalist.find(params[:id])
    end
    @user = current_user
  end
  
  def destroy
    @qalist = current_user.qalists.find_by(id: params[:id])
    return redirect_to root_url if @qalist.nil?
    @qalist.destroy
    flash[:success] = "qalist deleted"
    redirect_to request.referrer || root_url
  end
  
  private
  def qalist_params
    params.require(:qalist).permit(:content)
  end
end
