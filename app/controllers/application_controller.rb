class ApplicationController < ActionController::Base
  
  include SessionsHelper
  
  private
  
  def require_user_logged_in
    unless logged_in?
      store_location
      flash[:danger] = 'ログインしてください。'
      redirect_to login_url
    end
  end
  
  def counts(user)
    @count_microposts = user.microposts.count
    @count_followings = user.followings.count
    @count_followers = user.followers.count
    @count_fav_microposts = user.fav_microposts.count
  end
end
