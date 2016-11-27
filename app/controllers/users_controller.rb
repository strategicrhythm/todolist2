class UsersController < ApplicationController
  before_action :logged_in_user, only: [:edit, :update]
  before_action :correct_user, only: [:edit, :update]
  
  def show
    @user = User.find(params[:id])
    @todolists = @user.todolists.order(created_at: :desc)
    @todolist = current_user.todolists.build if logged_in?
    @latest_items = current_user.latest_items.order(created_at: :desc).limit(1) if logged_in?
    @feed_items = current_user.feed_items.includes(:user).order(created_at: :desc) if logged_in?
    @qalists = @user.qalists.order(created_at: :desc)
    @qalist = current_user.qalists.build if logged_in?
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "welcome to the Sample application"
      redirect_to @user
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end
  
  def following
    @title = "Following"
    @user = User.find(params[:id])
    @users = @user.following_users.order(created_at: :desc)
  end
  
  def followers
    @title = "Followers"
    @user = User.find(params[:id])
    @users = @user.follower_users.order(created_at: :desc)
  end
  
  private

  def user_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation)
  end
  
  def correct_user
    @user = User.find(params[:id])
    unless @user == current_user
    redirect_to(root_url)
    end
  end
  
  def todolist_params
        params.require(:todolist).permit(
          :title, :things, :note, :situation, :avatar, :approver, :status,
          listtables_attributes: [:id, :todolist_id, :title, :things, :note, :situation, :avatar, :status, :_destroy]
        )
  end
  
  def qalist_params
    params.require(:qalist).permit(:content)
  end
  
end
