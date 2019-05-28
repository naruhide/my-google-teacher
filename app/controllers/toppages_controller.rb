class ToppagesController < ApplicationController
  def index
    if logged_in?
      @micropost = current_user.microposts.build
      @microposts = Micropost.order(id: :desc).page(params[:page])
    else
      @microposts = Micropost.order(id: :desc).page(params[:page])
    end
  end
end