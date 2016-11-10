class StaticPagesController < ApplicationController
  def home
    @todolist = current_user.todolists.build if logged_in?
    @feed_items = current_user.feed_items.includes(:user).order(created_at: :desc) if logged_in?
  end
end
