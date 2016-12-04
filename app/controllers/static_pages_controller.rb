class StaticPagesController < ApplicationController
  def home
    @todolist = current_user.todolists.build if logged_in?
    @feed_items = current_user.feed_items.includes(:user).order(created_at: :desc) if logged_in?
    @latest_items = current_user.latest_items.order(created_at: :desc).limit(1) if logged_in?
    @qalist = current_user.qalists.build if logged_in?
    @latest_qalists = current_user.latest_qalists.order(created_at: :desc).limit(1) if logged_in?
  end
  
end
