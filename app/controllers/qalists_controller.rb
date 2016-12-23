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
    @answered_comments = Comment.where(answer_id: '@qalist.id', answer_td_id: '@qalist.line0').order(created_at: :desc) if logged_in?
    @answered_comments_1 = Comment.where(answer_id: '@qalist.id', answer_td_id_1: '@qalist.line1').order(created_at: :desc) if logged_in?
    @answered_comments_2 = Comment.where(answer_id: '@qalist.id', answer_td_id_2: '@qalist.line2').order(created_at: :desc) if logged_in?
    @answered_comments_3 = Comment.where(answer_id: '@qalist.id', answer_td_id_3: '@qalist.line3').order(created_at: :desc) if logged_in?
    @answered_comments_4 = Comment.where(answer_id: '@qalist.id', answer_td_id_4: '@qalist.line4').order(created_at: :desc) if logged_in?
    @answered_comments_5 = Comment.where(answer_id: '@qalist.id', answer_td_id_5: '@qalist.line5').order(created_at: :desc) if logged_in?
    @answered_comments_6 = Comment.where(answer_id: '@qalist.id', answer_td_id_6: '@qalist.line6').order(created_at: :desc) if logged_in?
    @answered_comments_7 = Comment.where(answer_id: '@qalist.id', answer_td_id_7: '@qalist.line7').order(created_at: :desc) if logged_in?
    @answered_comments_8 = Comment.where(answer_id: '@qalist.id', answer_td_id_8: '@qalist.line8').order(created_at: :desc) if logged_in?
    @answered_comments_9 = Comment.where(answer_id: '@qalist.id', answer_td_id_9: '@qalist.line9').order(created_at: :desc) if logged_in?
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
  
  def comment_params
    params.require(:comment).permit(:content, :answer_id, :answer_td_id, :answer_td_id_1, :answer_td_id_2,
     :answer_td_id_3,  :answer_td_id_4,  :answer_td_id_5,  :answer_td_id_6,  :answer_td_id_7,
     :answer_td_id_8,  :answer_td_id_9,)
  end
  
end
