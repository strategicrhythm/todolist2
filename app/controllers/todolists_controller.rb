class TodolistsController < ApplicationController
before_action :logged_in_user, only: [:create, :edit, :update, :show]

  def create
    @todolist = current_user.todolists.build(todolist_params)
    if @todolist.save
      flash[:success] = "Todolist created!"
      redirect_to root_url
    else
      @feed_items = current_user.feed_items.includes(:user).order(created_at: :desc)
      render 'static_pages/home'
    end
  end
  
  def show
    @todolist = current_user.todolists.find_by(id: params[:id])
    if @todolist.nil?
      @todolist = Todolist.find(params[:id])
    end
    @user = current_user
  end
  
  def destroy
    @todolist = current_user.todolists.find_by(id: params[:id])
    return redirect_to root_url if @todolist.nil?
    @todolist.destroy
    flash[:success] = "todolist deleted"
    redirect_to request.referrer || root_url
  end
  
  def edit
     @todolist = current_user.todolists.find_by(id: params[:id])
     @user = current_user
    if @todolist.nil?
      @todolist = Todolist.find(params[:id])
    end
  end
  
  def update
    @todolist = current_user.todolists.find_by(id: params[:id])
    if @todolist.nil?
      @todolist = Todolist.find(params[:id])
    end
    if @todolist.update_attributes(todolist_params)
      flash[:success] = "Todolist updated"
      @todolist.save
      redirect_to @todolist
    else
      render 'edit'
    end
  end
  
  private
  
  def todolist_params
        params.require(:todolist).permit(
          :title, :things, :note, :situation, :avatar, :approver, :status,
          listtables_attributes: [:id, :todolist_id, :title, :things, :note, :situation, :avatar, :status, :_destroy]
        )
  end
  
end