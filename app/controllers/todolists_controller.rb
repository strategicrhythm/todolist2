class TodolistsController < ApplicationController
before_action :logged_in_user, only: [:create, :edit, :update]

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
    @todolist = Todolist.find(params[:id])
    @user = current_user
    return redirect_to root_url if @todolist.nil?
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
  end
  
  def update
    @todolist = current_user.todolists.find_by(id: params[:id])
    if @todolist.update_attributes(todolist_params)
      flash[:success] = "Todolist updated"
      redirect_to @todolist
    else
      render 'edit'
    end
  end
  
  private
  
  def todolist_params
        params.require(:todolist).permit(
          :title, :things, :note,
          listtables_attributes: [:id, :todolist_id, :title, :things, :note, :_destroy]
        )
  end
  
end