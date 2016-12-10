class QalistsController < ApplicationController
 before_action :logged_in_user, only: [:create, :edit, :update, :show]

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
    @comment = current_user.comments.build if logged_in?
    @comments = @user.comments.order(created_at: :desc)
  end
  
  def destroy
    @qalist = current_user.qalists.find_by(id: params[:id])
    return redirect_to root_url if @qalist.nil?
    @qalist.destroy
    flash[:success] = "qalist deleted"
    redirect_to request.referrer || root_url
  end
  
  def edit
     @qalist = current_user.qalists.find_by(id: params[:id])
     @user = current_user
    if @qalist.nil?
      @qalist = Qalist.find(params[:id])
    end
  end
  
  def update
    @qalist = current_user.qalists.find_by(id: params[:id])
    if @qalist.nil?
      @qalist = Qalist.find(params[:id])
    end
    if @qalist.update_attributes(qalist_params)
      flash[:success] = "Q&Alist updated"
      @qalist.save
      redirect_to @qalist
    else
      render 'edit'
    end
  end
  
  private
  def qalist_params
    params.require(:qalist).permit(:title, :content, :answer, :query0, :line0, 
    :tdnumber0, :query1, :line1, :tdnumber1, :query2, :line2, :tdnumber2, 
    :query3, :line3, :tdnumber3, :query4, :line4, :tdnumber4, :query5, :line5, :tdnumber5, 
    :query6, :line6, :tdnumber6, :query7, :line7, :tdnumber7, :query8, :line8, :tdnumber8, 
    :query9, :line9, :tdnumber9)
  end
end
