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
    params.require(:comment).permit(:content)
  end
end
