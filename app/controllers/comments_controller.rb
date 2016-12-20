class CommentsController < ApplicationController
  before_action :logged_in_user, only: [:create]

  def create
    @comment = current_user.comments.build(comment_params)
    if @comment.save
      flash[:success] = "comment created!"
      redirect_to :back
    else
      render 'static_pages/home'
    end
  end
  
  private
  def comment_params
    params.require(:comment).permit(:content, :answer_id, :answer_td_id, :answer_td_id_1, :answer_td_id_2,
     :answer_td_id_3,  :answer_td_id_4,  :answer_td_id_5,  :answer_td_id_6,  :answer_td_id_7,
     :answer_td_id_8,  :answer_td_id_9,)
  end
end
